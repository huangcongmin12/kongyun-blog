package net.kongyunblog.service.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.dao.LinkDao;
import net.kongyunblog.domain.Link;
import net.kongyunblog.service.LinkService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LinkServiceImpl implements LinkService {
	
	@Autowired
	private LinkDao linkDao;

	public int getCount() {
		return linkDao.selectCount();
	}

	public void save(Link link) {
		link.setCategoryId((long)2);
		linkDao.insert(link);
	}

	public void delete(long id) {
		linkDao.delete(id);
	}

	public void update(Link link) {
		linkDao.update(link);
	}

	public Link get(long id) {
		return linkDao.selectLinkById(id);
	}

	public List<Link> listPage(int pageNow, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", (pageNow-1)*pageSize);
		params.put("size", pageSize);
		return linkDao.selectPage(params);
	}

	public List<Link> listOrder() {
		return linkDao.selectOrder();
	}

}
