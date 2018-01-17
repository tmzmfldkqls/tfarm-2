package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tfarm.board.dao.AlbumDao;
import com.tfarm.board.model.TicketDto;
import com.tfarm.util.BoardConstance;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(TicketDto albumDto) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		return albumDao.writeArticle(albumDto);
	}

	@Override
	public TicketDto viewArticle(int seq) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		return null;
	}

	@Override
	public List<TicketDto> listArticle(Map<String, String> map) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.ALBUM_LIST_SIZE * pg;
		int start = end - BoardConstance.ALBUM_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return albumDao.listArticle(map);
	}

	@Override
	public void modifyArticle(TicketDto albumDto) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);

	}

	@Override
	public void deleteArticle(int seq) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);

	}

}
