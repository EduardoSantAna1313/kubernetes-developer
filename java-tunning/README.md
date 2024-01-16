

## Config travar app:

```yaml
        - name: java-tuning
          image: java-tuning:v1
          env:
            - name: JAVA_TOOL_OPTIONS
              value: "-XX:ActiveProcessorCount=2 -XX:MaxRAMPercentage=75 -XX:+UseParallelGC"
          resources:
            requests:
              memory: 512M
              cpu: 1000m
            limits:
              memory: 512M
              cpu: 1000m
```