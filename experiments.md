# Recipes for experiments

* Modify the [Agent config](./config-agent.yaml) to allow insecure communication (`insecure: true`) for the `otlp/auth` exporter
    +   Note: make sure that the `bearertokenauth` extension is still referenced in the `service` configuration
* How does the system behave if the Agent collector uses an expired token?
* What happens if you use `otel/opentelemetry:0.31.0`
    +   Note: debugging the "unary server interceptor was already set and may not be reset" panic associated with this version (only when auth is enabled on the receiver, OFC) took me all the way back to the application source code and then a few days after that
    +   Note: this example was tested and validated using `otel/opentelemetry:0.33.0`, which does not generate the same panic
* Make a typo somewhere in one of the configuration files (depending on where the typo is, these can be fairly nasty to debug)
* Rename one of the services in the [Docker compose](./docker-compose.yaml) file
    +   On a user-defined bridge network, containers can resolve each other by name, so changing a service name probably breaks something
* Use a different name for the user-defined bridge network (maybe  `randolph`)?
+ Add an additional exporter to either your Agent, Gateway, or both
    +   Note: one of the noted advantages of OpenTelemetry is the ability to export telemetry, e.g., traces to multiple backend data stores
    +   Note: although this is not technically a breaking change, modifying system behavior fits into that category of "things you'll probably have to do if you run this application in production"