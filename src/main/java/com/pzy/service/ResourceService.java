
package com.pzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pzy.entity.Resource;
import com.pzy.repository.ResourceRepository;

@Service
public class ResourceService {
     @Autowired
     private ResourceRepository resourceRepository;
    
     public void delete(Long id){
    	 resourceRepository.delete(id);
     }
     public Resource find(Long id){
    	  return resourceRepository.findOne(id);
     }
     public void save(Resource resource){
    	 resourceRepository.save(resource);
     }
}