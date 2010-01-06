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
package org.cytoscapeweb.view {
	import flash.errors.IllegalOperationError;
	
	import org.cytoscapeweb.model.ConfigProxy;
	import org.cytoscapeweb.model.ExternalInterfaceProxy;
	import org.cytoscapeweb.model.GraphProxy;
	import org.puremvc.as3.patterns.mediator.Mediator;

    /**
     * Abstract superclass of all mediators used by Cytoscape Web.
     * It just caches and exposes the proxies to its subclasses.
     */ 
    public class BaseAppMediator extends Mediator {

        // ========[ CONSTANTS ]====================================================================
        
        // ========[ PRIVATE PROPERTIES ]===========================================================
        
        private var _configProxy:ConfigProxy;
        private var _graphProxy:GraphProxy;
        private var _extProxy:ExternalInterfaceProxy;

        // ========[ PROTECTED PROPERTIES ]=========================================================
   
        protected function get graphProxy():GraphProxy {
            if (_graphProxy == null)
                _graphProxy = facade.retrieveProxy(GraphProxy.NAME) as GraphProxy;
            return _graphProxy;
        }
        
        protected function get configProxy():ConfigProxy {
            if (_configProxy == null)
                _configProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
            return _configProxy;
        }
        
        protected function get extProxy():ExternalInterfaceProxy {
            if (_extProxy == null)
                _extProxy = facade.retrieveProxy(ExternalInterfaceProxy.NAME) as ExternalInterfaceProxy;
            return _extProxy;
        }

        // ========[ CONSTRUCTOR ]==================================================================
   
        public function BaseAppMediator(name:String, viewComponent:Object, self:Object) {
        	super(name, viewComponent);
        	
        	if (self != this)
               throw new IllegalOperationError("VizMapper is an abstract class and should be instatiated only by its subclasses.");
        }
    }
}