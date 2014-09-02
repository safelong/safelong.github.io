
package yyc.roster;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.jivesoftware.database.DbConnectionManager;
import org.jivesoftware.database.SequenceManager;
import org.jivesoftware.openfire.roster.RosterItem;
import org.jivesoftware.openfire.roster.RosterItemProvider;
import org.jivesoftware.openfire.user.UserAlreadyExistsException;
import org.jivesoftware.openfire.user.UserNotFoundException;
import org.jivesoftware.util.JiveConstants;
import org.jivesoftware.util.JiveGlobals;
import org.jivesoftware.util.LocaleUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmpp.packet.JID;

/**
 * Defines the provider methods required for creating, reading, updating and deleting roster
 * items.<p>
 *
 * Rosters are another user resource accessed via the user or chatbot's long ID. A user/chatbot
 * may have zero or more roster items and each roster item may have zero or more groups. Each
 * roster item is additionaly keyed on a XMPP jid. In most cases, the entire roster will be read
 * in from memory and manipulated or sent to the user. However some operations will need to retrive
 * specific roster items rather than the entire roster.
 *
 * @author Iain Shigeoka
 */
public class CustomRosterItemProvider implements RosterItemProvider {

	private static final Logger Log = LoggerFactory.getLogger(CustomRosterItemProvider.class);

    private static final String LOAD_USERNAMES =
            "SELECT DISTINCT username from roster WHERE jid=?";
    private static final String COUNT_ROSTER_ITEMS =
            "SELECT COUNT(rosterID) FROM roster WHERE username=?";
    private static final String LOAD_ROSTER =
             "SELECT jid, rosterID, 3, -1, -1, '' FROM roster WHERE username=?";

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#createItem(java.lang.String, org.jivesoftware.openfire.roster.RosterItem)
	 */
	public RosterItem createItem(String username, RosterItem item)
            throws UserAlreadyExistsException
    {
		throw new UnsupportedOperationException();
    }

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#updateItem(java.lang.String, org.jivesoftware.openfire.roster.RosterItem)
	 */
	public void updateItem(String username, RosterItem item) throws UserNotFoundException {
		throw new UnsupportedOperationException();
    }

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#deleteItem(java.lang.String, long)
	 */
	public void deleteItem(String username, long rosterItemID) {
		throw new UnsupportedOperationException();
	}

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#getUsernames(java.lang.String)
	 */
	public Iterator<String> getUsernames(String jid) {
		System.out.println("getUsernames:"+jid);
        List<String> answer = new ArrayList<String>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(LOAD_USERNAMES);
            pstmt.setString(1, jid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                answer.add(rs.getString(1));
            }
        }
        catch (SQLException e) {
            Log.error(LocaleUtils.getLocalizedString("admin.error"), e);
        }
        finally {
            DbConnectionManager.closeConnection(rs, pstmt, con);
        }
        return answer.iterator();
    }

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#getItemCount(java.lang.String)
	 */
	public int getItemCount(String username) {
		System.out.println("getItemCount:"+username);
        int count = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(COUNT_ROSTER_ITEMS);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        catch (SQLException e) {
            Log.error(LocaleUtils.getLocalizedString("admin.error"), e);
        }
        finally {
            DbConnectionManager.closeConnection(rs, pstmt, con);
        }
        return count;
    }

    /* (non-Javadoc)
	 * @see org.jivesoftware.openfire.roster.RosterItemProvider#getItems(java.lang.String)
	 */
	public Iterator<RosterItem> getItems(String username) {
		System.out.println("getItems:"+username);
        LinkedList<RosterItem> itemList = new LinkedList<RosterItem>();
        Map<Long, RosterItem> itemsByID = new HashMap<Long, RosterItem>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Load all the contacts in the roster
            con = getConnection();
            pstmt = con.prepareStatement(LOAD_ROSTER);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // Create a new RosterItem (ie. user contact) from the stored information
                RosterItem item = new RosterItem(rs.getLong(2),
                        new JID(rs.getString(1)),
                        RosterItem.SubType.getTypeFromInt(rs.getInt(3)),
                        RosterItem.AskType.getTypeFromInt(rs.getInt(4)),
                        RosterItem.RecvType.getTypeFromInt(rs.getInt(5)),
                        rs.getString(6),
                        null);
                // Add the loaded RosterItem (ie. user contact) to the result
                itemList.add(item);
                itemsByID.put(item.getID(), item);
            }
            // Close the statement and result set
            DbConnectionManager.fastcloseStmt(rs, pstmt);
            // Set null to pstmt to be sure that it's not closed twice. It seems that
            // Sybase driver is raising an error when trying to close an already closed statement.
            // it2000 comment: TODO interesting, that's the only place with the sybase fix
            // it2000 comment: one should move this in closeStatement()
            pstmt = null;
        }
        catch (SQLException e) {
            Log.error(LocaleUtils.getLocalizedString("admin.error"), e);
        }
        finally {
            DbConnectionManager.closeConnection(rs, pstmt, con);
        }
        return itemList.iterator();
    }

	private Connection getConnection() throws SQLException {
	    return DriverManager.getConnection(JiveGlobals.getProperty("jdbcProvider.connectionString"));
	}
}
