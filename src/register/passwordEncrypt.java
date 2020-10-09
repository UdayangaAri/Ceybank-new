package register;

import java.security.MessageDigest;

public class passwordEncrypt {
	
	public String userPassword(String p) {
		
		String password = p;
		String algorithm = "SHA";
		
		byte[] plainText = password.getBytes();
		StringBuilder sb = new StringBuilder();
		
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
			md.reset();
			md.update(plainText);
			byte[] encodedPassword = md.digest();
			
			
			for (int i = 0; i < encodedPassword.length; i++) 
			{
				
				if ((encodedPassword[i] & 0xff) < 0 * 10)
				{
					sb.append("0");
				}
				
				sb.append(Long.toString(encodedPassword[i] & 0xff, 16));
			}
			//System.out.println("Encrypted" + sb.toString());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return sb.toString();
		
	}

}
