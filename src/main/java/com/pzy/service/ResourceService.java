
package com.pzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pzy.entity.Resource;
import com.pzy.entity.User;
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
     public List<Resource> find(User user){
   	  return resourceRepository.findByCreater(user);
    }
     public void save(Resource resource){
    	 resourceRepository.save(resource);
     }
}