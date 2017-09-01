{
    "listen_port": PORT,
    "secret": "SECRET",
    "template_path": "./templates",
    "tyk_js_path": "./js/tyk.js",
    "middleware_path": "./middleware",
    "use_db_app_configs": false,
    "app_path": "./test_apps/",
    "storage": {
        "type": "redis",
        "host": "REDISHOST",
        "port": RPORT,
        "username": "REDISUSER",
        "password": "REDISPW",
        "database": 0,
        "optimisation_max_idle": 500
    },
    "enable_analytics": true,
    "analytics_config": {
        "type": "rpc",
        "csv_dir": "/tmp",
        "mongo_url": "localhost",
        "mongo_db_name": "tyk_analytics",
        "mongo_collection": "tyk_analytics",
        "purge_delay": 10,
        "ignored_ips": [],
        "enable_geo_ip": true,
        "geo_ip_db_path": "/app/GeoLite2-City.mmdb",
        "normalise_urls": {
            "enabled": true,
            "normalise_uuids": true,
            "normalise_numbers": true,
            "custom_patterns": []
        }
    },
    "health_check": {
        "enable_health_checks": false,
        "health_check_value_timeouts": 60
    },
    "optimisations_use_async_session_write": true,
    "allow_master_keys": false,
    "policies": {
      "policy_source": "rpc",
      "policy_record_name": "tyk_policies"
    },
    "hash_keys": true,
    "suppress_redis_signal_reload": false,
    "use_sentry": false,
    "sentry_code": "",
    "enforce_org_data_age": true,
    "http_server_options": {
        "enable_websockets": true
    },
    "monitor": {
        "enable_trigger_monitors": true,
        "configuration": {
        "method": "POST",
            "target_path": "http://cloud.tyk.io/1337/tyk/webhook",
            "template_path": "templates/monitor_template.json",
            "header_map": {"x-tyk-monitor-secret": "sjdkfhjKHKJHkjsdhsufdudfhjHKIHJ1"},
            "event_timeout": 10
        },
        "global_trigger_limit": 80.0,
        "monitor_user_keys": false,
        "monitor_org_keys": true
    },
    "slave_options": {
        "use_rpc": true,
        "rpc_key": "ORGID",
        "api_key": "APIKEY",
        "connection_string": "MDCB",
        "enable_rpc_cache": true,
        "bind_to_slugs": USESLUGS
    },
    "local_session_cache": {
        "disable_cached_session_state": false,
        "cached_session_timeout": 5,
        "cached_session_eviction": 10
    },
    "enforce_org_quotas": false,
    "experimental_process_org_off_thread": true,
    "enable_non_transactional_rate_limiter": true,
    "enable_sentinel_rate_limiter": false,
    "auth_override": {
        "force_auth_provider": true,
        "auth_provider": {
            "name": "",
            "storage_engine": "rpc",
            "meta": {}
        }
    },
    "enable_context_vars": true,
    "hostname": "",
    "enable_api_segregation": false,
    "control_api_hostname": "",
    "enable_custom_domains": true,
    "enable_jsvm": true,
    "coprocess_options": {
        "enable_coprocess": true
    },
    "hide_generator_header": false,
    "event_handlers": {
        "events": {}
    },
    "pid_file_location": "/app/tyk-gateway.pid",
    "allow_insecure_configs": true,
    "public_key_path": "",
    "close_idle_connections": false,
    "allow_remote_config": false,
    "enable_bundle_downloader": true,
    "service_discovery": {
        "default_cache_timeout": 20
    },
    "close_connections": true,
    "max_idle_connections_per_host": 100,
    "disable_dashboard_zeroconf": true
}
