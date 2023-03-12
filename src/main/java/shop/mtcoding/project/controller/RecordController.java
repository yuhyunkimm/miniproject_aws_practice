package shop.mtcoding.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import reactor.core.publisher.DirectProcessor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.FluxProcessor;
import reactor.core.publisher.FluxSink;
import reactor.core.publisher.Mono;
import shop.mtcoding.project.model.Record;
import shop.mtcoding.project.service.RecordService;

@RestController
public class RecordController {

    // private final FluxProcessor<String, String> processor = DirectProcessor.create().serialize();
    // private final FluxSink<String> sink = processor.sink();

    // @Autowired
    // private RecordService recordService;

    // @PostMapping("/records")
    // public Mono<Record> addRecord(@RequestBody Record record) {
    //     return recordService.addRecord(record)
    //             .doOnSuccess(r -> sink.next("Record added: " + r.getId()));
    // }

    // // @PutMapping("/records/{id}")
    // // public Mono<Record> updateRecord(@PathVariable String id, @RequestBody Record record) {
    // //     return recordService.updateRecord(id, record)
    // //             .doOnSuccess(r -> sink.next("Record updated: " + r.getId()));
    // // }

    // @GetMapping(value = "/stream/records", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    // public Flux<String> streamRecords() {
    //     return processor;
    // }
}