package music.com.vn.service;

import music.com.vn.dao.ArtistDao;
import music.com.vn.dto.ArtistDTO;
import music.com.vn.dto.CollectionArtistDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.model.ArtistEntity;
import music.com.vn.utils.Utils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



@Service
@Transactional
public class ArtistServiceImpl implements ArtistService {

	@Autowired
	private ArtistDao ArtistDAO;
	@Autowired
	private ModelMapper modelMapper;

	public ArtistDTO save(ArtistDTO Artist) {
		ArtistEntity DtotoEntity = modelMapper.map(Artist, ArtistEntity.class);
		ArtistDTO ArtistDto = new ArtistDTO();
		Date date = new Date();
		DtotoEntity.setModifiedAt(date);
		DtotoEntity.setCreatedAt(date);
		String image = Artist.getImage();
		if (image != null)
			DtotoEntity.setImage(Utils.writeOrUpdate("artist", image));
		Long id = ArtistDAO.create(DtotoEntity);
		ArtistDto = modelMapper.map(ArtistDAO.findOne(id), ArtistDTO.class);
		return ArtistDto;
	}
	
	public ArtistDTO update(ArtistDTO Artist) {
		ArtistEntity entity = modelMapper.map(Artist, ArtistEntity.class);
		ArtistEntity result = ArtistDAO.update(entity);
		return modelMapper.map(result, ArtistDTO.class);
	}

	public boolean delete(Long id) {
		if (ArtistDAO.findOne(id) == null) {
			return false;
		}
		ArtistDAO.deleteById(id);
		return true;
	}

	public ArtistDTO findOne(Long id) {
		if (id <= 0) {
			return null;
		}
		ArtistEntity Artistentity = ArtistDAO.findOne(id);
		if (Artistentity == null) {
			return null;
		}
		return modelMapper.map(ArtistDAO.findOne(id), ArtistDTO.class);
	}

	@Override
	public List<ArtistDTO> findAll() {
		List<ArtistEntity> Artistentities = ArtistDAO.findAll();
		List<ArtistDTO> listArtist=new ArrayList<>();
		for (ArtistEntity kind : Artistentities){
			listArtist.add(modelMapper.map(kind,ArtistDTO.class));
		}
		return listArtist;
	}

	public CollectionArtistDTO findAll(Pagination page) {
		List<ArtistEntity> listArtistEntity = ArtistDAO.findAll(page);
		List<ArtistDTO> listArtistDTO = convertCollectionToDTO(listArtistEntity);
		int totalElementArtist = ArtistDAO.count();
		page.setTotalElement(totalElementArtist);
		return setCollectionDTO(listArtistDTO, page);
	}

	private List<ArtistDTO> convertCollectionToDTO(List<ArtistEntity> listArtistEntity) {
		List<ArtistDTO> listDTO = new ArrayList<>();
		for (ArtistEntity ArtistEntity : listArtistEntity) {
			listDTO.add(modelMapper.map(ArtistEntity, ArtistDTO.class));
		}
		return listDTO;
	}

	private CollectionArtistDTO setCollectionDTO(List<ArtistDTO> list, Pagination page) {
		CollectionArtistDTO listcollection = new CollectionArtistDTO();
		listcollection.setPage(page);
		listcollection.setListDTo(list);
		return listcollection;

	}
	
	
	
	

	
}
