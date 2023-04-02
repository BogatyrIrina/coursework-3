package me.bogatyr.coursework3.service;

import me.bogatyr.coursework3.model.Operation;
import me.bogatyr.coursework3.model.Sock;
import me.bogatyr.coursework3.model.Type;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class AuditService {
    private final List<Operation> operations = new ArrayList<>();
    public void recordAddOperation(Sock sock, int quantity) {
        recordOperation(Type.ADD, sock, quantity);
    }

    public void recordIssueOperation(Sock sock, int quantity) {
        recordOperation(Type.ISSUE, sock, quantity);
    }

    public void recordRemoveDefectedOperation(Sock sock, int quantity) {
        recordOperation(Type.REMOVE_DEFECTED, sock, quantity);
    }
    private void recordOperation(Type type, Sock sock, int quantity){
        this.operations.add(new Operation(type, LocalDateTime.now(), quantity, sock));

    }
}
