# poetrybug

How to use:

~~~
docker build --build-arg VERSION=1.1.14 -t poetrybug .
docker run --rm -it poetrybug

docker build --build-arg VERSION=1.2.0 -t poetrybug .
docker run --rm -it poetrybug
~~~

This is a repo to reproduce following error on version 1.1.14:

~~~
Traceback (most recent call last):
  File "/home/buggy/app/run.py", line 3, in <module>
    from logstash_async.handler import AsynchronousLogstashHandler
  File "/opt/runtime/.venv/lib/python3.10/site-packages/logstash_async/handler.py", line 11, in <module>
    from logstash_async.worker import LogProcessingWorker
  File "/opt/runtime/.venv/lib/python3.10/site-packages/logstash_async/worker.py", line 12, in <module>
    from limits import parse as parse_rate_limit
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/__init__.py", line 5, in <module>
    from . import _version, aio, storage, strategies
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/aio/__init__.py", line 1, in <module>
    from . import storage, strategies
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/aio/storage/__init__.py", line 6, in <module>
    from .base import MovingWindowSupport, Storage
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/aio/storage/base.py", line 5, in <module>
    from limits.storage.registry import StorageRegistry
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/storage/__init__.py", line 12, in <module>
    from .base import MovingWindowSupport, Storage
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/storage/base.py", line 6, in <module>
    from limits.util import LazyDependency
  File "/opt/runtime/.venv/lib/python3.10/site-packages/limits/util.py", line 11, in <module>
    import pkg_resources
ModuleNotFoundError: No module named 'pkg_resources'
~~~
