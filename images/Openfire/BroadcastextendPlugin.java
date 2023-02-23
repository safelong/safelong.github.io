
package yyc.plugin;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.dom4j.Element;
import org.jivesoftware.openfire.SessionManager;
import org.jivesoftware.openfire.XMPPServer;
import org.jivesoftware.openfire.container.Plugin;
import org.jivesoftware.openfire.container.PluginManager;
import org.jivesoftware.openfire.group.Group;
import org.jivesoftware.openfire.group.GroupManager;
import org.jivesoftware.openfire.group.GroupNotFoundException;
import org.jivesoftware.openfire.user.User;
import org.jivesoftware.openfire.user.UserManager;
import org.jivesoftware.util.JiveGlobals;
import org.jivesoftware.util.PropertyEventDispatcher;
import org.jivesoftware.util.PropertyEventListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xmpp.component.Component;
import org.xmpp.component.ComponentException;
import org.xmpp.component.ComponentManager;
import org.xmpp.component.ComponentManagerFactory;
import org.xmpp.packet.IQ;
import org.xmpp.packet.JID;
import org.xmpp.packet.Message;
import org.xmpp.packet.Packet;
import org.xmpp.packet.PacketError;
import org.xmpp.packet.Presence;

public class BroadcastextendPlugin implements Plugin, Component {

	private static final Logger Log = LoggerFactory.getLogger(BroadcastextendPlugin.class);

    private String serviceName;
    private GroupManager groupManager;
    private ComponentManager componentManager;
    private PluginManager pluginManager;

    public BroadcastextendPlugin() {
        serviceName = "broadcastextend";
    }

    public void initializePlugin(PluginManager manager, File pluginDirectory) {
        pluginManager = manager;
        groupManager = GroupManager.getInstance();

        // Register as a component.
        componentManager = ComponentManagerFactory.getComponentManager();
        try {
            componentManager.addComponent(serviceName, this);
        }
        catch (Exception e) {
            Log.error(e.getMessage(), e);
        }
    }

    public void destroyPlugin() {
        // Unregister component.
        if (componentManager != null) {
            try {
                componentManager.removeComponent(serviceName);
            }
            catch (Exception e) {
                Log.error(e.getMessage(), e);
            }
        }
        componentManager = null;
        pluginManager = null;
        groupManager = null;
    }

    public void initialize(JID jid, ComponentManager componentManager) {
    }

    public void start() {
    }

    public void shutdown() {
    }

    public String getName() {
        // Get the name from the plugin.xml file.
        return pluginManager.getName(this);
    }

    public String getDescription() {
        // Get the description from the plugin.xml file.
        return pluginManager.getDescription(this);
    }

    public void processPacket(Packet packet) {
        boolean isGroupUser = false;
        Group group = null;
        String toNode = packet.getTo().getNode();
        // Check if user is allowed to send packet to this service[+group]
        try {
            if (toNode != null) {
                group = groupManager.getGroup(toNode);
                isGroupUser = group.isUser(packet.getFrom()) ||
                        group.isUser(new JID(packet.getFrom().toBareJID()));
            }
        }
        catch (GroupNotFoundException e) {
            // Ignore.
        }
        if (packet instanceof Message) {
            // Respond to incoming messages
            Message message = (Message)packet;
            processMessage(message, group, isGroupUser);
        }
    }

    private void processMessage(Message message, Group group, boolean isGroupUser) {
        if (group == null) {
            processError(message, "Group Address not valid");
        }
        else if (isGroupUser) {
            // Broadcast message to group users. Users that are offline will get
            // the message when they come back online
            for (JID userJID : group.getMembers()) {
                Message newMessage = message.createCopy();
                newMessage.setTo(userJID);
                
                Element extendInfo = newMessage.addChildElement("groupinfo", "groupinfo");
                extendInfo.addText(message.getTo().getNode());
                
                try {
                    componentManager.sendPacket(this, newMessage);
                }
                catch (Exception e) {
                    Log.error(e.getMessage(), e);
                }
            }
        }
        else {
        	processError(message, "Not target Group member");
        }
    }

	private void processError(Message message, String err) {
		// The address is not recognized so send an error message back.
		Message error = new Message();
		if (message.getID() != null) {
		    error.setID(message.getID());
		}
		error.setTo(message.getFrom());
		error.setFrom(message.getTo());
		error.setError(PacketError.Condition.not_allowed);
		error.setSubject("Error sending broadcast message");
		error.setBody(err);
		try {
		    componentManager.sendPacket(this, error);
		}
		catch (Exception e) {
		    Log.error(e.getMessage(), e);
		}
	}
}