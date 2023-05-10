package me.bogatyr.coursework3.controller;

import me.bogatyr.coursework3.dto.SockDto;
import me.bogatyr.coursework3.exeption.InsufficientSockQuantityException;
import me.bogatyr.coursework3.model.Color;
import me.bogatyr.coursework3.model.Size;
import me.bogatyr.coursework3.service.SockService;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("/sock")
public class SockController {
    private final SockService sockService;

    public SockController(SockService sockService) {
        this.sockService = sockService;
    }
    @ExceptionHandler(InsufficientSockQuantityException.class)
    public ResponseEntity<String> handleInvalidException(InsufficientSockQuantityException invalidSockRequestException){
        return ResponseEntity.badRequest().body(invalidSockRequestException.getMessage());
    }
    @PostMapping
    public void addSock(@RequestBody SockDto sockDto){
        sockService.addSock(sockDto);
    }
    @PutMapping
    public void issueSocks(@RequestBody SockDto sockDto){
        sockService.issueSock(sockDto);
    }
    @GetMapping
    public int getSocksCount(@RequestParam (required = false, name = "color") Color color,
                             @RequestParam (required = false, name = "size") Size size,
                             @RequestParam (required = false, name = "cottonMin") Integer cottonMin,
                             @RequestParam (required = false, name = "cottonMax") Integer cottonMax) {
        return sockService.getSockQuantity(color, size, cottonMin, cottonMax);
    }
    @DeleteMapping
    public void removeDefectiveSocks(@RequestBody SockDto sockDto){
        sockService.removeDefectiveSocks(sockDto);
    }
    @GetMapping("/export")
    public FileSystemResource exportData() throws IOException {
        return sockService.exportData();
    }
    @PostMapping(name = "/import", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> importData(@RequestParam("file") MultipartFile file) throws IOException {
        sockService.importData(file.getInputStream());
        return ResponseEntity.accepted().build();
    }
}
