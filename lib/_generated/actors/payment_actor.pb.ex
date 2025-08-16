defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.Service do
  use GRPC.Service,
    name: "io.eigr.labs.spawn.rinha.actors.PaymentActor",
    protoc_gen_elixir_version: "0.15.0"

  def descriptor do
    # credo:disable-for-next-line
    %Google.Protobuf.FileDescriptorProto{
      name: "actors/payment_actor.proto",
      package: "io.eigr.labs.spawn.rinha.actors",
      dependency: [
        "google/api/annotations.proto",
        "google/protobuf/empty.proto",
        "payments/payment.proto",
        "spawn/actors/extensions.proto"
      ],
      message_type: [],
      enum_type: [],
      service: [
        %Google.Protobuf.ServiceDescriptorProto{
          name: "PaymentActor",
          method: [
            %Google.Protobuf.MethodDescriptorProto{
              name: "Payment",
              input_type: ".io.eigr.labs.spawn.rinha.Payment",
              output_type: ".google.protobuf.Empty",
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
                    pattern: {:post, "/payments"},
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
                state_type: ".io.eigr.labs.spawn.rinha.PaymentActorState",
                stateful: true,
                deactivate_timeout: 3000,
                snapshot_interval: 60000,
                sourceable: false,
                strict_events_ordering: false,
                events_retention_strategy: nil,
                subjects: [],
                kind: :UNNAMED,
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
            span: [0, 0, 24, 1],
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
            span: [6, 0, 32],
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
            span: [9, 0, 24, 1],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 1],
            span: [9, 8, 20],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 3],
            span: [10, 2, 16, 4],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 3, 4_890_128],
            span: [10, 2, 16, 4],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0],
            span: [18, 2, 23, 3],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 1],
            span: [18, 6, 13],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 2],
            span: [18, 14, 47],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 3],
            span: [18, 58, 79],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 4],
            span: [19, 4, 22, 6],
            leading_comments: nil,
            trailing_comments: nil,
            leading_detached_comments: [],
            __unknown_fields__: []
          },
          %Google.Protobuf.SourceCodeInfo.Location{
            path: [6, 0, 2, 0, 4, 72_295_728],
            span: [19, 4, 22, 6],
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

  rpc(:Payment, Io.Eigr.Labs.Spawn.Rinha.Payment, Google.Protobuf.Empty, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "*",
        additional_bindings: [],
        response_body: "",
        pattern: {:post, "/payments"},
        __unknown_fields__: []
      }
    }
  })
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.Stub do
  use GRPC.Stub, service: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.Service
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.ActorDispatcher do
  use GRPC.Server,
    service: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.Service,
    http_transcode: true

  alias Sidecar.GRPC.Dispatcher

  @spec payment(Io.Eigr.Labs.Spawn.Rinha.Payment.t(), GRPC.Server.Stream.t()) ::
          Google.Protobuf.Empty.t()
  def payment(message, stream) do
    request = %{
      system: "rinha-system",
      actor_name: "PaymentActor",
      action_name: "Payment",
      input: message,
      stream: stream,
      descriptor: Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.Service.descriptor()
    }

    Dispatcher.dispatch(request)
  end
end

defmodule Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor do
  @moduledoc "This module provides helper functions for invoking the methods on the Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor actor."

  @doc """
  Invokes the get_state implicit action for this actor.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.get_state()
  {:ok, actor_state}
  ```
  """
  def get_state do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentActor"}
    |> get_state()
  end

  @doc """
  Invokes the get_state implicit action.

  ## Parameters
  - `ref` - The actor ref to send the action to.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.get_state(SpawnSdk.Actor.ref("rinha-system", "actor_id_01"))
  {:ok, actor_state}
  ```
  """
  def get_state(%SpawnSdk.ActorRef{} = ref) do
    opts = [
      system: ref.system || "rinha-system",
      action: "get_state",
      async: false
    ]

    actor_to_invoke = ref.name || "PaymentActor"

    opts =
      if actor_to_invoke == "PaymentActor" do
        opts
      else
        Keyword.put(opts, :ref, "PaymentActor")
      end

    SpawnSdk.invoke(actor_to_invoke, opts)
  end

  def payment() do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentActor"}
    |> payment(%Io.Eigr.Labs.Spawn.Rinha.Payment{}, [])
  end

  def payment(%Io.Eigr.Labs.Spawn.Rinha.Payment{} = payload) do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentActor"}
    |> payment(payload, [])
  end

  def payment(%Io.Eigr.Labs.Spawn.Rinha.Payment{} = payload, opts) when is_list(opts) do
    %SpawnSdk.ActorRef{system: "rinha-system", name: "PaymentActor"}
    |> payment(payload, opts)
  end

  def payment(%SpawnSdk.ActorRef{} = ref, %Io.Eigr.Labs.Spawn.Rinha.Payment{} = payload) do
    ref
    |> payment(payload, [])
  end

  @doc """
  Invokes the Payment method registered on PaymentActor.

  ## Parameters
  - `ref` - The actor ref to send the action to.
  - `payload` - The payload to send to the action.
  - `opts` - The options to pass to the action.

  ## Examples
  ```elixir
  iex> Io.Eigr.Labs.Spawn.Rinha.Actors.PaymentActor.payment(SpawnSdk.Actor.ref("rinha-system", "actor_id_01"), %Io.Eigr.Labs.Spawn.Rinha.Payment{}, async: false, metadata: %{"example" => "metadata"})
  {:ok, %Google.Protobuf.Empty{}}
  ```
  """
  def payment(%SpawnSdk.ActorRef{} = ref, %Io.Eigr.Labs.Spawn.Rinha.Payment{} = payload, opts)
      when is_list(opts) do
    opts = [
      system: ref.system || "rinha-system",
      action: "Payment",
      payload: payload,
      async: opts[:async] || false,
      metadata: opts[:metadata] || %{}
    ]

    actor_to_invoke = ref.name || "PaymentActor"

    opts =
      if actor_to_invoke == "PaymentActor" do
        opts
      else
        Keyword.put(opts, :ref, "PaymentActor")
      end

    SpawnSdk.invoke(actor_to_invoke, opts)
  end
end
