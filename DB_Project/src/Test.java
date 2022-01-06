import java.io.IOException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.NoRouteToHostException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;

public class Test {

	public String getRequestApiPost(String url, String xml) throws IOException, NoRouteToHostException, ConnectException, Exception{
		URL objUrl = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) objUrl.openConnection();
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		connection.setDoInput(true);
		
		return "HI";
	}

}
