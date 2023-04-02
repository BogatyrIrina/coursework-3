package me.bogatyr.coursework3.configuration;

import me.bogatyr.coursework3.components.SizeConverter;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.nio.file.attribute.PosixFileAttributes;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {
    @Override
    protected void addFormatters(FormatterRegistry registry){
        registry.addConverter(new SizeConverter());
    }
}
