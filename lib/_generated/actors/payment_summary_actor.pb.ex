defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.Service do
  use GRPC.Service,
    name: "io.eigr.labs.spawn.rinha.actors.PaymentSummaryActor",
    protoc_gen_elixir_version: "0.15.0"

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.FileDescriptorProto{
      name: "actors/payment_summary_actor.proto",
      package: "io.eigr.labs.spawn.rinha.actors",
      dependency: [
        "google/api/annotations.proto",
        "google/protobuf/empty.proto",
        "payments/payment_summary.proto",
        "spawn/actors/extensions.proto"
      ],
      message_type: [],
      enum_type: [],
      service: [
        %Google.Protobuf.ServiceDescriptorProto{
          name: "PaymentSummaryActor",
          method: [
            %Google.Protobuf.MethodDescriptorProto{
              name: "GetPaymentSummary",
              input_type: ".google.protobuf.Empty",
              output_type: ".io.eigr.labs.spawn.rinha.PaymentSummaryResponse",
              options: %Google.Protobuf.MethodOptions{
                deprecated: false,
                idempotency_level: :IDEMPOTENCY_UNKNOWN,
                features: nil,
                uninterpreted_option: [],
                __pb_extensions__: %{
                  {Google.Api.PbExtension, :http} => %Google.Api.HttpRule{
                    selector: "",
                    body: "*",
                    additional_bindings: [],
                    response_body: "",
                    pattern: {:get, "/summary"},
                    __unknown_fields__: []
                  }
                },
                __unknown_fields__: []
              },
              client_streaming: false,
              server_streaming: false,
              __unknown_fields__: []
            }
          ],
          options: %Google.Protobuf.ServiceOptions{
            deprecated: false,
            features: nil,
            uninterpreted_option: [],
            __pb_extensions__: %{
              {Spawn.Actors.PbExtension, :actor} => %Spawn.Actors.ActorOpts{
                state_type: ".io.eigr.labs.spawn.rinha.PaymentSummaryProjection",
                stateful: true,
                deactivate_timeout: 0,
                snapshot_interval: 0,
                sourceable: false,
                strict_events_ordering: false,
                events_retention_strategy: %Spawn.Actors.EventsRetentionStrategy{
                  strategy: {:duration_ms, 86000},
                  __unknown_fields__: []
                },
                subjects: [
                  %Spawn.Actors.ProjectionSubject{
                    actor: "PaymentActor",
                    source_action: "Payment",
                    action: "Summarize",
                    start_time: nil,
                    __unknown_fields__: []
                  }
                ],
                kind: :PROJECTION,
                __unknown_fields__: []
              }
            },
            __unknown_fields__: []
          },
          __unknown_fields__: []
        }
      ],
      extension: [],
      options: nil,
      source_code_info: %Google.Protobuf.SourceCodeInfo{
        location: [
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [],
            span: [0, 0, 29, 1],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: ~c"\f",
            span: [0, 0, 18],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [2],
            span: [2, 0, 40],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [3, 0],
            span: [4, 0, 38],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [3, 1],
            span: [5, 0, 37],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [3, 2],
            span: [6, 0, 40],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [3, 3],
            span: [7, 0, 39],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0],
            span: [9, 0, 29, 1],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 1],
            span: ~c"\t\b\e",
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 3],
            span: [10, 2, 21, 4],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 3, 4_890_128],
            span: [10, 2, 21, 4],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0],
            span: [23, 2, 28, 3],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 1],
            span: [23, 6, 23],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 2],
            span: [23, 24, 45],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 3],
            span: [23, 56, 104],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 4],
            span: [24, 4, 27, 6],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 4, 72_295_728],
            span: [24, 4, 27, 6],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          }
        ],
        __pb_extensions__: %{},
        __unknown_fields__: []
      },
      public_dependency: [],
      weak_dependency: [],
      syntax: "proto3",
      edition: nil,
      __unknown_fields__: []
    }
  end

  rpc(
    :GetPaymentSummary,
    Google.Protobuf.Empty,
    Io.Eigr.Labs.Spawn.Rinha.PaymentSummaryResponse,
    %{
      http: %{
        type: Google.Api.PbExtension,
        value: %Google.Api.HttpRule{
          selector: "",
          body: "*",
          additional_bindings: [],
          response_body: "",
          pattern: {:get, "/summary"},
          __unknown_fields__: []
        }
      }
    }
  )
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.Stub do
  use GRPC.Stub, service: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.Service
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.ActorDispatcher do
  use GRPC.Server,
    service: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.Service,
    http_transcode: true

  alias Sidecar.GRPC.Dispatcher

  @spec get_payment_summary(Google.Protobuf.Empty.t(), GRPC.Server.Stream.t()) ::
          Io.Eigr.Labs.Spawn.Rinha.PaymentSummaryResponse.t()
  def get_payment_summary(message, stream) do
    request = %{
      system: "rinha-system",
      actor_name: "PaymentSummaryActor",
      action_name: "GetPaymentSummary",
      input: message,
      stream: stream,
      descriptor: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.Service.descriptor()
    }

    Dispatcher.dispatch(request)
  end
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor do
  @moduledoc "This module provides helper functions for invoking the methods on the Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor actor."

  @doc """
  Invokes the get_state implicit action for this actor.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.get_state()
  {:ok, actor_state}
  ```
  """
  def get_state do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentSummaryActor"}
    |> get_state()
  end

  @doc """
  Invokes the get_state implicit action.

  ## Parameters
  - `ref` - The actor ref to send the action to.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.get_state(SpawnSdk.Actor.ref("rinha-system", "actor_id_01"))
  {:ok, actor_state}
  ```
  """
  def get_state(%SpawnSdk.ActorRef{} = ref) do
    opts = [
      system: ref.system || "rinha-system",
      action: "get_state",
      async: false
    ]

    actor_to_invoke = ref.name || "PaymentSummaryActor"

    opts =
      if actor_to_invoke == "PaymentSummaryActor" do
        opts
      else
        Keyword.put(opts, :ref, "PaymentSummaryActor")
      end

    SpawnSdk.invoke(actor_to_invoke, opts)
  end

  def get_payment_summary() do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentSummaryActor"}
    |> get_payment_summary(%Google.Protobuf.Empty{}, [])
  end

  def get_payment_summary(%Google.Protobuf.Empty{} = payload) do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentSummaryActor"}
    |> get_payment_summary(payload, [])
  end

  def get_payment_summary(%Google.Protobuf.Empty{} = payload, opts) when is_list(opts) do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentSummaryActor"}
    |> get_payment_summary(payload, opts)
  end

  def get_payment_summary(%SpawnSdk.ActorRef{} = ref, %Google.Protobuf.Empty{} = payload) do
    ref
    |> get_payment_summary(payload, [])
  end

  @doc """
  Invokes the GetPaymentSummary method registered on PaymentSummaryActor.

  ## Parameters
  - `ref` - The actor ref to send the action to.
  - `payload` - The payload to send to the action.
  - `opts` - The options to pass to the action.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentSummaryActor.get_payment_summary(SpawnSdk.Actor.ref("rinha-system", "actor_id_01"), %Google.Protobuf.Empty{}, async: false, metadata: %{"example" => "metadata"})
  {:ok, %Io.Eigr.Labs.Spawn.Rinha.PaymentSummaryResponse{}}
  ```
  """
  def get_payment_summary(%SpawnSdk.ActorRef{} = ref, %Google.Protobuf.Empty{} = payload, opts)
      when is_list(opts) do
    opts = [
      system: ref.system || "rinha-system",
      action: "GetPaymentSummary",
      payload: payload,
      async: opts[:async] || false,
      metadata: opts[:metadata] || %{}
    ]

    actor_to_invoke = ref.name || "PaymentSummaryActor"

    opts =
      if actor_to_invoke == "PaymentSummaryActor" do
        opts
      else
        Keyword.put(opts, :ref, "PaymentSummaryActor")
      end

    SpawnSdk.invoke(actor_to_invoke, opts)
  end
end
