/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.liveasy.Dao.DaoIMPL;

import cc.liveasy.Dao.TruckDao;
import cc.liveasy.Model.TruckDetails;
import cc.liveasy.RowMapper.TruckRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Saurabh Rana
 */
@Repository
public class TruckDaoIMPL implements TruckDao {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

    }

    @Override
    public int addTruckDetails(TruckDetails truck) {
        SimpleJdbcInsert si = new SimpleJdbcInsert(dataSource).withTableName("truck_details").usingGeneratedKeyColumns("shipperId");
        Map<String, Object> params = new HashMap<>();
        params.put("loadingPoint", truck.getLoadingPoint());
        params.put("unloadingPoint", truck.getUnloadingPoint());
        params.put("productType", truck.getProductType());
        params.put("truckType", truck.getTruckType());
        params.put("noOfTrucks", truck.getNoOfTrucks());
        params.put("weight", truck.getWeight());
        params.put("Date", truck.getDate());
        params.put("comment", truck.getComment());
        int truckId = si.executeAndReturnKey(params).intValue();
        return truckId;

    }

    private String allTruckDetails = "select * from truck_details";

    @Override
    public List<TruckDetails> getAllTruckDetails() {
        return this.jdbcTemplate.query(allTruckDetails, new TruckRowMapper());
    }

    @Override
    public TruckDetails getTruckByShipperId(int ShipperId) {
        String sqlString = this.allTruckDetails + " where shipperId=:Id ";
        Map<String, Object> params = new HashMap<>();
        params.put("Id", ShipperId);
        return this.namedParameterJdbcTemplate.queryForObject(sqlString, params, new TruckRowMapper());
    }

    @Override
    public int editTruckDetails(TruckDetails truck) {
        String updateTruckDeta = " update truck_details set loadingPoint=:Lpoint, unloadingPoint=:ULpoint, productType=:Ptype, truckType=:Ttype, "
                + " noOfTrucks=:Ntrucks, weight=:Weight, Date=:date , comment=:Comment where shipperId=:Id ";
        Map<String, Object> params = new HashMap<>();
        params.put("Id", truck.getShipperId());
        params.put("Lpoint", truck.getLoadingPoint());
        params.put("ULpoint", truck.getUnloadingPoint());
        params.put("Ptype", truck.getProductType());
        params.put("Ttype", truck.getTruckType());
        params.put("Ntrucks", truck.getNoOfTrucks());
        params.put("Weight", truck.getWeight());
        params.put("date", truck.getDate());
        params.put("Comment", truck.getComment());

        return this.namedParameterJdbcTemplate.update(updateTruckDeta, params);

    }

    @Override
    public int deleteTruckDetailsById(int shipperId) {
        String sqlString = "DELETE from truck_details where shipperId=:shipperId";
        Map<String, Object> params = new HashMap<>();
        params.put("shipperId", shipperId);
        return this.namedParameterJdbcTemplate.update(sqlString, params);
    }

    @Override
    public List<TruckDetails> searchTruckByShipperId(int shipperId) {
        String sql = "SELECT * FROM truck_details WHERE shipperId=:shipperId";
        Map<String, Object> params = new HashMap<>();
        params.put("shipperId", shipperId);
        return namedParameterJdbcTemplate.query(sql, params, new TruckRowMapper());

    }

}
