package music.com.vn.controller.api;

import music.com.vn.dto.ArtistDTO;
import music.com.vn.dto.CollectionArtistDTO;
import music.com.vn.dto.Pagination;
import music.com.vn.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class ArtistController {
	@Autowired
	ArtistService Artistservice;

	@PostMapping("/apitest/artist")
	public ResponseEntity<ArtistDTO> create(@RequestBody ArtistDTO Artist) {
		ArtistDTO Artistdto = Artistservice.save(Artist);
		return ResponseEntity.ok(Artistdto);
	}
	@PutMapping(value = "/apitest/artist/{id}")
	public ResponseEntity<ArtistDTO> update(@PathVariable Long id,@RequestBody ArtistDTO Artistdto) {
		Artistdto = Artistservice.update(Artistdto);
		if (null == Artistdto) {
			return new ResponseEntity<ArtistDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Artistdto);
	}

	@GetMapping("/apitest/artist/{id}")
	public ResponseEntity<ArtistDTO> getOne(@PathVariable("id") Long id) {
		ArtistDTO Artistdto = Artistservice.findOne(id);
		if (Artistdto == null) {
			return new ResponseEntity<ArtistDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(Artistdto);
	}

	@SuppressWarnings("rawtypes")
	@DeleteMapping("/apitest/artist/{id}")
	public ResponseEntity delete(@PathVariable Long id) {
		if (Artistservice.delete(id) == false) {
			return new ResponseEntity<ArtistDTO>(HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(id);

	}

	@GetMapping("/apitest/artist")
	public ResponseEntity<CollectionArtistDTO> getallPage( @RequestParam(name = "size", defaultValue = "10") int recordPerPage,
		      @RequestParam(name = "page", defaultValue = "0") int pageIndex) {
		Pagination page=new Pagination();
		page.setSize(recordPerPage);
		page.setPageCurrent(pageIndex);
		CollectionArtistDTO dto = Artistservice.findAll( page);
		if (dto == null) {
			return new ResponseEntity<CollectionArtistDTO>( HttpStatus.NOT_FOUND);
		}
		return ResponseEntity.ok(dto);
	}

	@GetMapping("/apitest/artist-all")
	public ResponseEntity<List<ArtistDTO>> getallPage() {
		List<ArtistDTO> listdto = Artistservice.findAll();
		return ResponseEntity.ok(listdto);
	}

}
