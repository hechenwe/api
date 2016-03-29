package com.sooncode.api.background.util;

import java.util.UUID;

public class MyUUID {
	public static String getUUID() {
		String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		return uuid;
	}
}
