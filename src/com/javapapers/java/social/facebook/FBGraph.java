package com.javapapers.java.social.facebook;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

public class FBGraph {
	private String accessToken;

	public FBGraph(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getFBGraph() {
		String graph = null;
		try {
			
			//standard by facebook
			//https://graph.facebook.com/me?fields=name,gender&access_token=<access-token>
			
			//by this developer
			//String g = "https://graph.facebook.com/me?" + accessToken;
			
			
			//My
			String g = "https://graph.facebook.com/me?fields=email,gender,first_name,last_name,name" + "&"+accessToken;
			URL u = new URL(g);
			URLConnection c = u.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					c.getInputStream()));
			String inputLine;
			StringBuffer b = new StringBuffer();
			while ((inputLine = in.readLine()) != null)
				b.append(inputLine + "\n");
			in.close();
			graph = b.toString();
			System.out.println(graph);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("ERROR in getting FB graph data. " + e);
		}
		return graph;
	}

	public Map<String, String> getGraphData(String fbGraph) {
		
		Map<String, String> fbProfile = new HashMap<String, String>();
		try {
			JSONObject json = new JSONObject(fbGraph);
			if (json.has("id"))
				fbProfile.put("id", json.getString("id"));
			
			if (json.has("first_name"))
				fbProfile.put("first_name", json.getString("first_name"));
			
			if (json.has("email"))
				fbProfile.put("email", json.getString("email"));
			
			if (json.has("gender"))
				fbProfile.put("gender", json.getString("gender"));	
			
			if(json.has("last_name"))
				fbProfile.put("last_name", json.getString("last_name"));
			
			if (json.has("name"))
				fbProfile.put("name", json.getString("name"));
		} catch (JSONException e) {
			e.printStackTrace();
			throw new RuntimeException("ERROR in parsing FB graph data. " + e);
		}
		return fbProfile;
	}
}
