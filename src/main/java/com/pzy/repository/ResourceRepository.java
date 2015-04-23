package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.pzy.entity.Resource;
public interface ResourceRepository extends PagingAndSortingRepository<Resource, Long>,JpaSpecificationExecutor<Resource>{
}

