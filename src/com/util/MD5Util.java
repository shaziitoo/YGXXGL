package com.util;

import java.security.MessageDigest;

public class MD5Util
{
	public static String md5(String s)
	{
		try
		{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(s.getBytes("UTF-8"));
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < bytes.length; i++)
			{
				String hex = Integer.toHexString(0xff & bytes[i]);
				if (hex.length() == 1) sb.append('0');
				sb.append(hex);
			}
			return sb.toString();
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}
	}
}