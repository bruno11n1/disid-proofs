// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Arrays;
import java.util.Locale;
import javax.validation.Valid;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Vet;
import org.springframework.roo.petclinic.domain.reference.Specialty;
import org.springframework.roo.petclinic.service.api.VetService;
import org.springframework.roo.petclinic.web.VetsItemThymeleafController;
import org.springframework.roo.petclinic.web.VetsItemThymeleafLinkFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect VetsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: VetsItemThymeleafController: @Controller;
    
    declare @type: VetsItemThymeleafController: @RequestMapping(value = "/vets/{vet}", name = "VetsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource VetsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<VetsItemThymeleafController> VetsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param vetService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public VetsItemThymeleafController.new(VetService vetService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setVetService(vetService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(VetsItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource VetsItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void VetsItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<VetsItemThymeleafController> VetsItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void VetsItemThymeleafController.setItemLink(MethodLinkBuilderFactory<VetsItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Vet
     */
    @ModelAttribute
    public Vet VetsItemThymeleafController.getVet(@PathVariable("vet") Long id, Locale locale, HttpMethod method) {
        Vet vet = null;
        if (HttpMethod.PUT.equals(method)) {
            vet = vetService.findOneForUpdate(id);
        } else {
            vet = vetService.findOne(id);
        }
        
        if (vet == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Vet", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return vet;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView VetsItemThymeleafController.show(@ModelAttribute Vet vet, Model model) {
        model.addAttribute("vet", vet);
        return new ModelAndView("vets/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView VetsItemThymeleafController.showInline(@ModelAttribute Vet vet, Model model) {
        model.addAttribute("vet", vet);
        return new ModelAndView("vets/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("vet")
    public void VetsItemThymeleafController.initVetBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VetsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("birthDay_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("employedSince_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("createdDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        model.addAttribute("modifiedDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VetsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
        model.addAttribute("specialty", Arrays.asList(Specialty.values()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView VetsItemThymeleafController.editForm(@ModelAttribute Vet vet, Model model) {
        populateForm(model);
        
        model.addAttribute("vet", vet);
        return new ModelAndView("vets/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView VetsItemThymeleafController.update(@Valid @ModelAttribute Vet vet, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("vets/edit");
        }
        // Concurrency control
        Vet existingVet = getVetService().findOne(vet.getId());
        if(vet.getVersion() != existingVet.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("vet", vet);
            model.addAttribute("concurrency", true);
            return new ModelAndView("vets/edit");
        } else if(vet.getVersion() != existingVet.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("vet", existingVet);
            model.addAttribute("concurrency", false);
            return new ModelAndView("vets/edit");
        } else if(vet.getVersion() != existingVet.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            vet.setVersion(existingVet.getVersion());
        }
        Vet savedVet = getVetService().save(vet);
        UriComponents showURI = getItemLink().to(VetsItemThymeleafLinkFactory.SHOW).with("vet", savedVet.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> VetsItemThymeleafController.delete(@ModelAttribute Vet vet) {
        getVetService().delete(vet);
        return ResponseEntity.ok().build();
    }
    
}
