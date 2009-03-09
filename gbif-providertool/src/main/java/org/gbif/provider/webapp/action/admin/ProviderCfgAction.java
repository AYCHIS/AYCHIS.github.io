/***************************************************************************
 * Copyright (C) 2008 Global Biodiversity Information Facility Secretariat.
 * All Rights Reserved.
 *
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.

 ***************************************************************************/

package org.gbif.provider.webapp.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.gbif.provider.service.GeoserverManager;
import org.gbif.provider.service.RegistryManager;
import org.gbif.provider.service.impl.RegistryManagerImpl;
import org.gbif.provider.util.AppConfig;
import org.gbif.provider.webapp.action.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;

public class ProviderCfgAction extends BaseAction  {
	private static final String GOOGLE_MAPS_LOCALHOST_KEY = "ABQIAAAAaLS3GE1JVrq3TRuXuQ68wBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQY-Unm8BwXJu9YioYorDsQkvdK0Q";
	@Autowired
	private RegistryManager registryManager;
	@Autowired
	private GeoserverManager geoManager;
	private String organisationKey;
	
	
	public String execute() {
		check();
		return SUCCESS;
	}

	public String save() throws Exception {
		if (cancel != null) {
			return "cancel";
		}
		this.cfg.save();
		saveMessage(getText("config.updated"));
		check();
		return SUCCESS;
	}
	

	public String registerOrg(){
		if (isOrgRegistered()){
			saveMessage("The organisation is already registered with GBIF");
		}else{
			// register new organisation
			cfg.getOrg().setUddiID(organisationKey);
			if (registryManager.registerOrg()){
				saveMessage(getText("register.org.success"));
				saveMessage(getText("register.thanks"));
			}else{
				cfg.resetOrg();
				cfg.setOrgNode(null);
				saveMessage(getText("register.org.problem"));
			}
			this.cfg.save();
		}
		return SUCCESS;
	}

	public String registerIpt(){
		if (!isOrgRegistered()){
			cfg.getOrg().setUddiID(StringUtils.trimToNull(organisationKey));
		}		
		if (isIptRegistered()){
			saveMessage(getText("register.ipt.already"));
		}else if (isOrgRegistered()){
			saveMessage(getText("register.org.missing"));
		}else if (StringUtils.trimToNull(cfg.getOrgPassword())==null){
			saveMessage(getText("register.org.password.missing"));
		}else{
			// register IPT with organisation
			if (registryManager.registerIPT()){
				saveMessage(getText("register.ipt.success"));
				this.cfg.save();
			}else{
				saveMessage(getText("register.ipt.problem"));
			}
		}
		return SUCCESS;
	}

	public String updateGeoserver() throws Exception {
		try {
			geoManager.updateCatalog();
			saveMessage(getText("config.geoserverUpdated"));
		} catch (IOException e) {
			saveMessage(getText("config.geoserverNotUpdated"));
		}
		return SUCCESS;
	}

	private void check() {
		File f = new File(cfg.getDataDir());
		// tests
		if (StringUtils.trimToNull(cfg.getIpt().getContactEmail())==null || StringUtils.trimToNull(cfg.getIpt().getContactName())==null){
			saveMessage(getText("config.check.contact"));
		}
		if (!f.isDirectory() || !f.canWrite()){
			saveMessage(getText("config.check.iptDataDir"));
		}
		if (StringUtils.trimToNull(cfg.getGeoserverUrl())==null || !cfg.getGeoserverUrl().startsWith("http")){
			saveMessage(getText("config.check.geoserverUrl"));
		}
		f = new File(cfg.getGeoserverDataDir());
		if (!f.isDirectory() || !f.canWrite()){
			saveMessage(getText("config.check.geoserverDataDir"));
		}
		if (!geoManager.login(cfg.getGeoserverUser(), cfg.getGeoserverUser(), cfg.getGeoserverUrl())){
			saveMessage(getText("config.check.geoserverLogin"));
		}
		if (StringUtils.trimToNull(cfg.getGoogleMapsApiKey())==null || StringUtils.trimToEmpty(cfg.getGoogleMapsApiKey()).equalsIgnoreCase(GOOGLE_MAPS_LOCALHOST_KEY)){
			saveMessage(getText("config.check.googleMapsApiKey"));
		}
		if (StringUtils.trimToNull(cfg.getOrg().getUddiID())==null){
			saveMessage(getText("config.check.org.uddi"));
		}else if (StringUtils.trimToNull(cfg.getOrgPassword())==null){
			saveMessage(getText("config.check.orgPassword"));
		}else{
			// test login credentials at:
			// http://gbrds.gbif.org/registry/organization/4BEC1EC0-04B9-11DE-BBF6-C4393BAE3AC3?op=login
			if (!registryManager.testLogin()){
				// authorization error
				saveMessage(getText("config.check.orgLogin"));
			}
		}
	}
	
	private boolean isOrgRegistered(){
		if (StringUtils.trimToNull(cfg.getOrg().getUddiID())==null){
			return false;
		}
		return true;
	}
	private boolean isIptRegistered(){
		if (StringUtils.trimToNull(cfg.getIpt().getUddiID())==null){
			return false;
		}
		return true;
	}
	public AppConfig getConfig() {
		return this.cfg;
	}
	public void setConfig(AppConfig cfg) {
		this.cfg = cfg;
	}
	public String getRegistryOrgUrl(){
		return RegistryManagerImpl.REGISTRY_ORG_URL;
	}
	public String getRegistryServiceUrl(){
		return RegistryManagerImpl.REGISTRY_SERVICE_URL;
	}
	public String getRegistryNodeUrl(){
		return RegistryManagerImpl.REGISTRY_NODE_URL;
	}

	public void setOrganisationKey(String organisationKey) {
		this.organisationKey = organisationKey;
	}

}