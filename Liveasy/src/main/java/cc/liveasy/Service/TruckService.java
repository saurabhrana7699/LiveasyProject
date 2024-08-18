/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cc.liveasy.Service;

import cc.liveasy.Exception.liveasyException;
import cc.liveasy.Model.TruckDetails;
import java.util.List;

/**
 *
 * @author Saurabh Rana
 */
public interface TruckService {

    public int addTruckDetails(TruckDetails truck) throws liveasyException;

    public List<TruckDetails> getAllTruckDetails()throws liveasyException;

    public int editTruckDetails(TruckDetails truck)throws liveasyException;

    public int deleteTruckDetailsById(int shipperId)throws liveasyException;

    public List<TruckDetails> searchTruckByShipperId(int shipperId)throws liveasyException;

    public TruckDetails getTruckByShipperId(int ShipperId)throws liveasyException;

}
