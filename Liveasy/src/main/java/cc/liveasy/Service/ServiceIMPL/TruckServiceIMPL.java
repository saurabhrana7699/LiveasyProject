/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.liveasy.Service.ServiceIMPL;

import cc.liveasy.Dao.TruckDao;
import cc.liveasy.Exception.liveasyException;
import cc.liveasy.Model.TruckDetails;
import cc.liveasy.Service.TruckService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Saurabh Rana
 */
@Service
public class TruckServiceIMPL implements TruckService {

    @Autowired
    private TruckDao truckDao;

    @Override
    public int addTruckDetails(TruckDetails truck) throws liveasyException{
        return this.truckDao.addTruckDetails(truck);
    }

    @Override
    public List<TruckDetails> getAllTruckDetails()throws liveasyException {
        return this.truckDao.getAllTruckDetails();
    }

    @Override
    public int editTruckDetails(TruckDetails truck) throws liveasyException{
        return this.truckDao.editTruckDetails(truck);
    }

    @Override
    public int deleteTruckDetailsById(int shipperId) throws liveasyException{
        return this.truckDao.deleteTruckDetailsById(shipperId);
    }

    @Override
    public List<TruckDetails> searchTruckByShipperId(int shipperId) throws liveasyException{
        return this.truckDao.searchTruckByShipperId(shipperId);
    }

    @Override
    public TruckDetails getTruckByShipperId(int ShipperId)throws liveasyException {
        return this.truckDao.getTruckByShipperId(ShipperId);
    }

}
