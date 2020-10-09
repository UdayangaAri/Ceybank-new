package RoomReservation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connections.DBConnection;

public class RoomDAO {

	public static int save(Rooms rooms) {
		
		int status=0;  
        try{  
            Connection con = DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(  
                         "insert into reservation_details(Res_Guest_Name,Guest_type, Guest_pf, Res_Guest_NIC, Res_Guest_Email, Res_Guest_phone,"
                         + " Res_Branch, Res_Block, Res_RoomNo, Res_Meal_Plan, Res_Checkin, Res_Checkout, Price) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");  
            
           
            
            ps.setString(1,rooms.getGuestname()); 
            ps.setString(2,rooms.getGuestType()); 
            ps.setString(3,rooms.getPF());  
            ps.setString(4,rooms.getGuestNIC());  
            
            ps.setString(5,rooms.getGuestEmail());  
            ps.setString(6,rooms.getGuestMobile());
            
            ps.setString(7,rooms.getBranch());  
            ps.setString(8, rooms.getBlock());  
            ps.setString(9,rooms.getRoomNo());
            ps.setString(10,rooms.getMealPlan());  
            
            ps.setString(11,rooms.getCheckin());  
            ps.setString(12,rooms.getCheckout()); 
            
            ps.setString(13, rooms.getPrice());  
            
            status=ps.executeUpdate();  
            
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status; 
	}

}
