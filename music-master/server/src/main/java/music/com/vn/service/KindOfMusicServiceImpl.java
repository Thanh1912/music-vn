package music.com.vn.service;

import music.com.vn.dao.KindOfMusicDao;
import music.com.vn.dto.CollectionKindOfMusicDTO;
import music.com.vn.dto.KindOfMusicDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.model.KindOfMusicEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class KindOfMusicServiceImpl implements KindOfMusicService {

	@Autowired
	private KindOfMusicDao KindOfMusicDAO;
	@Autowired
	private ModelMapper modelMapper;

	public KindOfMusicDTO save(KindOfMusicDTO KindOfMusic) {

		KindOfMusicEntity DtotoEntity = modelMapper.map(KindOfMusic, KindOfMusicEntity.class);
		KindOfMusicDTO KindOfMusicDto = new KindOfMusicDTO();
		Date date = new Date();
		DtotoEntity.setModifiedAt(date);
		DtotoEntity.setCreatedAt(date);
		Long id = KindOfMusicDAO.create(DtotoEntity);
		KindOfMusicDto = modelMapper.map(KindOfMusicDAO.findOne(id), KindOfMusicDTO.class);
		return KindOfMusicDto;
	}

	public KindOfMusicDTO update(KindOfMusicDTO KindOfMusic) {
		KindOfMusicEntity entity = modelMapper.map(KindOfMusic, KindOfMusicEntity.class);
		KindOfMusicEntity result = KindOfMusicDAO.update(entity);
		return modelMapper.map(result, KindOfMusicDTO.class);
	}

	public boolean delete(Long id) {
		if (KindOfMusicDAO.findOne(id) == null) {
			return false;
		}
		KindOfMusicDAO.deleteById(id);
		return true;
	}

	public KindOfMusicDTO findOne(Long id) {
		if (id <= 0) {
			return null;
		}
		KindOfMusicEntity KindOfMusicentity = KindOfMusicDAO.findOne(id);
		if (KindOfMusicentity == null) {
			return null;
		}
		return modelMapper.map(KindOfMusicDAO.findOne(id), KindOfMusicDTO.class);
	}

	@Override
	public CollectionKindOfMusicDTO findAll(Pagination page) {
		List<KindOfMusicEntity> listKindOfMusicEntity = KindOfMusicDAO.findAll(page);
		List<KindOfMusicDTO> listKindOfMusicDTO = convertCollectionToDTO(listKindOfMusicEntity);
		int totalElementKindOfMusic = KindOfMusicDAO.count();
		page.setTotalElement(totalElementKindOfMusic);
		return setCollectionDTO(listKindOfMusicDTO, page);
	}

	private List<KindOfMusicDTO> convertCollectionToDTO(List<KindOfMusicEntity> listKindOfMusicEntity) {

		List<KindOfMusicDTO> listDTO = new ArrayList<>();
		for (KindOfMusicEntity KindOfMusicEntity : listKindOfMusicEntity) {
			listDTO.add(modelMapper.map(KindOfMusicEntity, KindOfMusicDTO.class));
		}
		return listDTO;
	}

	private CollectionKindOfMusicDTO setCollectionDTO(List<KindOfMusicDTO> list, Pagination page) {
		CollectionKindOfMusicDTO listcollection = new CollectionKindOfMusicDTO();
		listcollection.setPage(page);
		listcollection.setListDTo(list);
		return listcollection;

	}

	@Override
	public List<KindOfMusicDTO> findAll() {
		List<KindOfMusicEntity> KindOfMusicentities = KindOfMusicDAO.findAll();
		List<KindOfMusicDTO> listKindOfMusic=new ArrayList<>();
		for (KindOfMusicEntity kind : KindOfMusicentities){
			listKindOfMusic.add(modelMapper.map(kind,KindOfMusicDTO.class));
		}
		return listKindOfMusic;
	}

}
