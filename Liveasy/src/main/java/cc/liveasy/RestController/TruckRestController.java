/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.liveasy.RestController;

import cc.liveasy.Exception.liveasyException;
import cc.liveasy.Model.TruckDetails;
import cc.liveasy.Service.TruckService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Saurabh Rana
 */
@RestController
public class TruckRestController {

    @Autowired
    private TruckService truckService;

    @GetMapping("/viewAllTruckDetails.htm")
    public ResponseEntity<List<TruckDetails>> viewAllTruckDetails() throws liveasyException {

        try {
            List<TruckDetails> truck = this.truckService.getAllTruckDetails();
            return new ResponseEntity<List<TruckDetails>>(truck, HttpStatus.ACCEPTED);
        } catch (liveasyException e) {

            throw new liveasyException(" Truck Details are not Available/ Internal Server Error ");
        }

    }

    @GetMapping("/viewTruckById.htm/{id}")
    public ResponseEntity<List<TruckDetails>> viewTruckById(@PathVariable("id") int truckId) throws liveasyException {

        try {
            List<TruckDetails> truck = this.truckService.searchTruckByShipperId(truckId);
            return new ResponseEntity<List<TruckDetails>>(truck, HttpStatus.ACCEPTED);

        } catch (liveasyException e) {

            throw new liveasyException(" Truck Details are not Added/ Internal Server Error ");
        }

    }

    @PostMapping("/registerTruck.htm")
    public ResponseEntity<TruckDetails> RegisterTruckDetails(@RequestBody TruckDetails truck) throws liveasyException {

        try {
            return new ResponseEntity(this.truckService.addTruckDetails(truck), HttpStatus.ACCEPTED);
        } catch (liveasyException e) {

            throw new liveasyException(" Truck Details are not Added/ Internal Server Error ");
        }

    }

    @DeleteMapping("/deleteTruck.htm/{id}")
    public ResponseEntity<TruckDetails> deleteTruck(@PathVariable("id") int truck) throws liveasyException {

        try {
            return new ResponseEntity(this.truckService.deleteTruckDetailsById(truck), HttpStatus.ACCEPTED);
        } catch (liveasyException e) {

            throw new liveasyException(" Truck Details are not Deleted/ Internal Server Error ");
        }

    }

    @PutMapping("editTruckDetails.htm")
    public ResponseEntity<TruckDetails> editTruck(TruckDetails truck) throws liveasyException {
        try {
            return new ResponseEntity(this.truckService.editTruckDetails(truck), HttpStatus.ACCEPTED);
        } catch (liveasyException e) {

            throw new liveasyException(" Truck Details are not Edited/ Internal Server Error ");
        }
    }

}
