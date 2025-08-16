import Config

config :flame, :terminator,
  shutdown_timeout: :timer.minutes(3),
  failsafe_timeout: :timer.minutes(1),
  log: :debug

config :logger,
  backends: [:console],
  truncate: 65536,
  level: :debug

#  compile_time_purge_matching: [
#    [level_lower_than: :info]
#  ]

# Our Console Backend-specific configuration
config :logger, :console,
  format: "$date $time [$node]:[$metadata]:[$level]:$message\n",
  metadata: [:pid, :span_id, :trace_id]

config :protobuf, extensions: :enabled

config :opentelemetry, :resource, service: %{name: "spawn"}

config :opentelemetry,
       :processors,
       otel_batch_processor: %{
         exporter: {:opentelemetry_exporter, %{endpoints: [{:http, ~c"localhost", 55681, []}]}}
       }

config :spawn,
  acl_manager: Actors.Security.Acl.DefaultAclManager,
  split_brain_detector: Actors.Node.DefaultSplitBrainDetector

config :spawn, Spawn.Cache.LookupCache,
  backend: :shards,
  partitions: System.schedulers_online(),
  gc_interval: :timer.hours(12),
  max_size: 1_000_000,
  allocated_memory: 2_000_000_000,
  gc_cleanup_min_timeout: :timer.seconds(60),
  gc_cleanup_max_timeout: :timer.minutes(10)

config :mnesiac,
  stores: [Statestores.Adapters.Native.SnapshotStore],
  schema_type: :disc_copies,
  table_load_timeout: 600_000

import_config "#{config_env()}.exs"
