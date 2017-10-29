package com.auuid.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.transaction.annotation.Transactional;

public class SecurityMetadataSource implements FilterInvocationSecurityMetadataSource, InitializingBean {

	@Resource
	private RoleService roleService;
	
	//权限集合  
    private Map<RequestMatcher, Collection<ConfigAttribute>> requestMap;
    
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		HttpServletRequest request = ((FilterInvocation) object).getRequest();
        Collection<ConfigAttribute> attrs = Collections.emptyList();
        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
            if (entry.getKey().matches(request)) {
                attrs = entry.getValue();
                break;
            }
        }
        return attrs;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();
		for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {  
            allAttributes.addAll(entry.getValue());  
        }
        return allAttributes;  
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		 this.requestMap = this.bindRequestMap();  
	}

	private Map<RequestMatcher, Collection<ConfigAttribute>> bindRequestMap() {
		Map<RequestMatcher, Collection<ConfigAttribute>> map =   
                new LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>>();
        Map<String,String> resMap = this.loadResuorce();  
        for(Map.Entry<String,String> entry : resMap.entrySet()){  
            String key = entry.getKey();  
            Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();  
            atts = SecurityConfig.createListFromCommaDelimitedString(entry.getValue());  
            map.put(new AntPathRequestMatcher(key), atts);
        }  
          
        return map;
	}

	@Transactional
	private Map<String,String> loadResuorce() {
        Map<String,String> map = new LinkedHashMap<String,String>();  
        List<Role> roles = roleService.getAll();
        for (Role role : roles) {
        	for (com.auuid.security.Resource resource : role.getResources()) {
        		String resourcePath = resource.getName();
                String roleName = role.getName();
                if(map.containsKey(resourcePath)){  
                    map.put(resourcePath, map.get(resourcePath)+","+roleName);  
                }else{
                    map.put(resourcePath, roleName);  
                } 
            }
        }
        return map;
    }
}
