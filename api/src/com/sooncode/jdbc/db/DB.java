package com.sooncode.jdbc.db;

public class DB {
	/**
	 * 数据源唯一标识码
	 */
	private String key;
	private String driver;
	private String ip;
	private String port;
	private String dataName;
	private String encodeing;
	private String userName;
	private String password;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getEncodeing() {
		return encodeing;
	}

	public void setEncodeing(String encodeing) {
		this.encodeing = encodeing;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
