/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cc.liveasy.Controller;

import cc.liveasy.Exception.liveasyException;
import cc.liveasy.Model.TruckDetails;
import cc.liveasy.Service.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Saurabh Rana
 */
@Controller
public class TruckController {

    @Autowired
    private TruckService truckService;

    @RequestMapping("/index.htm")
    public String showIndex() {
        return "index";
    }

    @RequestMapping(value = "register.htm", method = RequestMethod.GET)
    public String showTruckDetails(ModelMap model) {
        model.addAttribute("Truck", new TruckDetails());
        return "addTruckDeta";

    }

    @RequestMapping(value = "register.htm", method = RequestMethod.POST)
    public String addTruckDetails(@ModelAttribute("Truck") TruckDetails truck, ModelMap model) throws liveasyException {
        try {
            int userId = this.truckService.addTruckDetails(truck);
            return "redirect:index.htm";

        } catch (Exception e) {

            model.addAttribute("Truck", truck);
            model.addAttribute("msg", "Truck not added - " + e.getMessage());
            return "addTruckDeta";
        }

    }

    @RequestMapping(value = "allTruckDetail.htm", method = RequestMethod.GET)
    public String allTruckDetails(ModelMap model) throws liveasyException {

        try {
            model.addAttribute("allTruck", this.truckService.getAllTruckDetails());
            return "allTruckDetails";
        } catch (liveasyException e) {
            throw new liveasyException("Truck Details are not Available/ Internal Server Error");
        }

    }

    @RequestMapping(value = "showEditTruck.htm", method = RequestMethod.POST)
    public String showEditTruck(int shipperId, ModelMap model) throws liveasyException {

        try {
            model.addAttribute("truck", this.truckService.getTruckByShipperId(shipperId));
            return "editTruck";
        } catch (liveasyException e) {
            throw new liveasyException(" Internal Server Error");
        }
    }

    @RequestMapping(value = "editTruck.htm", method = RequestMethod.POST)
    public String editTruck(@ModelAttribute("truck") TruckDetails truck, ModelMap model) {
        try {
            int rows = this.truckService.editTruckDetails(truck);
            if (rows == 0) {
                return "redirect:showEditTruck.htm?msg=Nothing to update";
            } else {
                return "redirect:allTruckDetail.htm?msg=User successfully updated   " + truck.getShipperId();
            }
        } catch (Exception e) {
            model.addAttribute("truck", truck);

            model.addAttribute("msg", "truck could not be updated - " + e.getMessage());
            return "editTruck";
        }

    }

    @RequestMapping(value = "deleteTruckDetails.htm", method = RequestMethod.POST)
    public String deleteTruckDetails(int deleteTruckId) throws liveasyException {
        try {
            int rows = this.truckService.deleteTruckDetailsById(deleteTruckId);
            return "redirect:allTruckDetail.htm?msg= Truck Details Deleted";
        } catch (liveasyException e) {
            throw new liveasyException(" Truck Details Not Deleted/ Internal Server Error");
        }
    }

    @RequestMapping(value = "searchById.htm", method = RequestMethod.GET)

    public String getTruckDetailsById(@RequestParam(defaultValue = "0") int truck, ModelMap model) throws liveasyException {
        try {
            model.addAttribute("truck", this.truckService.searchTruckByShipperId(truck));
            return "searchById";
        } catch (liveasyException e) {
            throw new liveasyException("Truck Detail Data Not Found/ Internal Server Error");
        }
    }

}
