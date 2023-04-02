package me.bogatyr.coursework3.service;

import me.bogatyr.coursework3.model.Sock;
import org.springframework.stereotype.Service;

@Service
public class AuditService {
    public void recordAddOperation(Sock sock, int quantity) {
    }

    public void recordIssueOperation(Sock sock, int quantity) {
    }

    public void recordRemoveDefectedOperation(Sock sock, int quantity) {
    }
}
