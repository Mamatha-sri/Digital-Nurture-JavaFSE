import java.io.*;
import java.net.*;

public class ex35server {
    public static void main(String[] args) throws Exception {

        ServerSocket server = new ServerSocket(5000);

        System.out.println("Waiting for client...");

        Socket socket = server.accept();

        BufferedReader br =
                new BufferedReader(
                        new InputStreamReader(socket.getInputStream()));

        String msg = br.readLine();

        System.out.println("Client: " + msg);

        socket.close();
        server.close();
    }
}