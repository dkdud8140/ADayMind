package com.callor.mind.dao.ext;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.callor.mind.dao.GenericDao;
import com.callor.mind.model.dto.LikeListDTO;
import com.callor.mind.model.dto.WriteListDTO;
import com.callor.mind.model.vo.WritingVO;

@Repository
public interface WritingViewDao extends GenericDao<WriteListDTO, String>{

	@Override
	default List<WriteListDTO> selectAll() {
		return null;
	}

	@Override
	default WriteListDTO selectById(String pk) {
		return null;
	}

	@Override
	default int insert(WriteListDTO vo) {
		return 0;
	}

	@Override
	default int update(WriteListDTO vo) {
		return 0;
	}

	@Override
	default int delete(WriteListDTO vo) {
		return 0;
	}

	public List<WriteListDTO> selectOderByLike();
	
	public List<LikeListDTO> selectByUserLike(String user);
	public List<WriteListDTO> selectMyWriting(String user);
	
	// 신고 들어온 글 셀렉트할 떄 빼도록.......................
}
