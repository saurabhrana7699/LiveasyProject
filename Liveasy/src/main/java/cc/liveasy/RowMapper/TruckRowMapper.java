/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.liveasy.RowMapper;

import cc.liveasy.Model.TruckDetails;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Saurabh Rana
 */
public class TruckRowMapper implements RowMapper<TruckDetails>{

    @Override
    public TruckDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
      
        TruckDetails truck = new TruckDetails(rs.getInt("shipperId"), rs.getString("loadingPoint"), rs.getString("unloadingPoint"), 
                rs.getString("productType"),rs.getString("truckType"), rs.getInt("noOfTrucks"), rs.getInt("weight"),
                rs.getString("comment"), rs.getDate("Date"));
        
        return truck;
    }
    
    
    
}
