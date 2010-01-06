/*
  This file is part of Cytoscape Web.
  Copyright (c) 2009, The Cytoscape Consortium (www.cytoscape.org)

  The Cytoscape Consortium is:
    - Agilent Technologies
    - Institut Pasteur
    - Institute for Systems Biology
    - Memorial Sloan-Kettering Cancer Center
    - National Center for Integrative Biomedical Informatics
    - Unilever
    - University of California San Diego
    - University of California San Francisco
    - University of Toronto

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
*/
package org.cytoscapeweb.controller {
    import org.cytoscapeweb.ApplicationFacade;
    import org.cytoscapeweb.model.GraphProxy;
    import org.cytoscapeweb.util.Groups;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;
    

    /**
     * Handle the selection of all nodes and edges.
     */
    public class SelectAllCommand extends SimpleCommand {
        
        override public function execute(notification:INotification):void {
            var group:String = notification.getBody() as String;
            if (group == null) group = Groups.NONE;
            var graphProxy:GraphProxy = facade.retrieveProxy(GraphProxy.NAME) as GraphProxy;

            if (group === Groups.NODES) {
                sendNotification(ApplicationFacade.SELECT, graphProxy.nodes);
            } else if (group === Groups.EDGES) {
                sendNotification(ApplicationFacade.SELECT, graphProxy.edges);
            } else if (group === Groups.NONE) {
                var arr:Array = graphProxy.nodes.concat(graphProxy.edges);
                sendNotification(ApplicationFacade.SELECT, arr);
            }
        }
    }
}
