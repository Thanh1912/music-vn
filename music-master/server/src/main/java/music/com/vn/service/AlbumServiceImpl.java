package music.com.vn.service;

import music.com.vn.dao.AlbumDAO;
import music.com.vn.dao.ArtistDao;
import music.com.vn.dao.KindOfMusicDao;
import music.com.vn.dao.UserDao;
import music.com.vn.dto.AlbumDTO;
import music.com.vn.dto.CollectionAlbumDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.dto.UserDTO;
import music.com.vn.model.AlbumEntity;
import music.com.vn.model.UserEntity;
import music.com.vn.utils.Utils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static java.lang.Math.toIntExact;
@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {

  @Autowired
  private AlbumDAO AlbumDAO;
  @Autowired
  private ArtistDao artistDao;

  @Autowired
  private UserDao userDao;

  @Autowired
  private KindOfMusicDao kindOfMusicDao;
  @Autowired
  private ModelMapper modelMapper;

  public AlbumDTO save(AlbumDTO Album) {
    AlbumEntity DtotoEntity = modelMapper.map(Album, AlbumEntity.class);
    AlbumDTO AlbumDto = new AlbumDTO();
    Date date = new Date();
    DtotoEntity.setModifiedAt(date);
    DtotoEntity.setCreatedAt(date);

    DtotoEntity.setArtistEntity(artistDao.findOne(Album.getIdKindOfMusic()));
    DtotoEntity.setKindOfMusicEntity(kindOfMusicDao.findOne(Album.getIdKindOfMusic()));
    String poster = Album.getPoster();
    if (poster != null)
      DtotoEntity.setPoster(Utils.writeOrUpdate("album", poster));
    DtotoEntity.setUserEntity(userDao.findOne(Album.getIdUser()));
    Long id = AlbumDAO.create(DtotoEntity);
    AlbumDto = modelMapper.map(AlbumDAO.findOne(id), AlbumDTO.class);
    return AlbumDto;
  }

  public AlbumDTO update(AlbumDTO Album) {
    if (Album != null) {
      Date date = new Date();
      Album.setModifiedAt(date);
      String poster = Album.getPoster();
      if (poster != null)
        Album.setPoster(Utils.writeOrUpdate("album", poster));
      AlbumEntity entity = modelMapper.map(Album, AlbumEntity.class);
      AlbumEntity result = AlbumDAO.update(entity);
      return modelMapper.map(result, AlbumDTO.class);
    }
    throw new BadCredentialsException("Invalid Null provided");
  }

  public boolean delete(Long id) {
    if (AlbumDAO.findOne(id) == null) {
      return false;
    }
    AlbumDAO.deleteById(id);
    return true;
  }

  public AlbumDTO findOne(Long id) {
    if (id <= 0) {
      return null;
    }
    AlbumEntity Albumentity = AlbumDAO.findOne(id);
    if (Albumentity == null) {
      return null;
    }
    return modelMapper.map(AlbumDAO.findOne(id), AlbumDTO.class);
  }

  @Override
  public List<AlbumDTO> findAll() {
    List<AlbumEntity> Albumentities = AlbumDAO.findAll();
    List<AlbumDTO> listAlbum = new ArrayList<>();
    for (AlbumEntity kind : Albumentities) {
      listAlbum.add(modelMapper.map(kind, AlbumDTO.class));
    }
    return listAlbum;
  }

  public CollectionAlbumDTO findAll(Pagination page) {
    List<AlbumEntity> listAlbumEntity = AlbumDAO.findAll(page);
    List<AlbumDTO> listAlbumDTO = convertCollectionToDTO(listAlbumEntity);
    int totalElementAlbum = AlbumDAO.count();
    page.setTotalElement(totalElementAlbum);
    return setCollectionDTO(listAlbumDTO, page);
  }

  @Override
  public UserDTO findUserByIdAlbum(Long idAlbum) {
    UserEntity userEntity = AlbumDAO.findUserByIdAlbum(idAlbum);
    return modelMapper.map(userEntity, UserDTO.class);
  }

  @Override
  public List<AlbumDTO> TopNew() {
    List<AlbumEntity> Albumentities = AlbumDAO.findAll();
    List<AlbumDTO> listAlbum = new ArrayList<>();
    for (AlbumEntity kind : Albumentities) {
      listAlbum.add(modelMapper.map(kind, AlbumDTO.class));
    }
    return listAlbum;
  }

  @Override
  public CollectionAlbumDTO findbyArtist(Pagination page, Long id) {
    List<AlbumEntity> listAlbumEntity = AlbumDAO.findbyArtist(page,id);
    List<AlbumDTO> listAlbumDTO = convertCollectionToDTO(listAlbumEntity);
    int totalElementAlbum =toIntExact( AlbumDAO.countbyArtist(id));
    page.setTotalElement(totalElementAlbum);
    return setCollectionDTO(listAlbumDTO, page);
  }

  @Override
  public CollectionAlbumDTO findbyUser(Pagination page, Long id) {
    List<AlbumEntity> listAlbumEntity = AlbumDAO.findbyUser(page,id);
    List<AlbumDTO> listAlbumDTO = convertCollectionToDTO(listAlbumEntity);
    int totalElementAlbum = toIntExact(AlbumDAO.countbyUser(id));
    page.setTotalElement(totalElementAlbum);
    return setCollectionDTO(listAlbumDTO, page);
  }

  private List<AlbumDTO> convertCollectionToDTO(List<AlbumEntity> listAlbumEntity) {

    List<AlbumDTO> listDTO = new ArrayList<>();
    for (AlbumEntity AlbumEntity : listAlbumEntity) {
      listDTO.add(modelMapper.map(AlbumEntity, AlbumDTO.class));
    }
    return listDTO;
  }

  private CollectionAlbumDTO setCollectionDTO(List<AlbumDTO> list, Pagination page) {
    CollectionAlbumDTO listcollection = new CollectionAlbumDTO();
    listcollection.setPage(page);
    listcollection.setListDTo(list);
    return listcollection;

  }

}
