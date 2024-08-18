/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cc.liveasy.Dao;

import cc.liveasy.Exception.liveasyException;
import cc.liveasy.Model.TruckDetails;
import java.util.List;

/**
 *
 * @author Saurabh Rana
 */
public interface TruckDao {
    
    public int addTruckDetails( TruckDetails truck) ;
    
    public List<TruckDetails> getAllTruckDetails() ;
    
    public int editTruckDetails(TruckDetails truck);
    
    public int deleteTruckDetailsById(int shipperId);
    
    public List<TruckDetails> searchTruckByShipperId(int shipperId);
    
    public TruckDetails getTruckByShipperId(int ShipperId);
    
    
    
}
