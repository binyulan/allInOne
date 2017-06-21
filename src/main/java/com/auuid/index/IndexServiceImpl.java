package com.auuid.index;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auuid.article.domain.Article;
import com.auuid.article.domain.ArticleType;
import com.auuid.article.service.ArticleService;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired private ArticleService articleService;
	
	public IndexDto getIndexDto() {
		IndexDto indexDto = new IndexDto();
		List<Article> articles = articleService.getArticles();
		List<ArticleType> articleTypes = Arrays.asList(ArticleType.values());
		indexDto.setArticles(articles);
		indexDto.setArticleTypes(articleTypes);
		return indexDto;
	}
}
