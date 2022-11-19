FROM python:3.10.8-slim-bullseye

ARG VERSION

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PYTHONDONTWRITEBYTECODE=1 \
  # pip:
  PIP_NO_CACHE_DIR=on \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=10 \
  # poetry:
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=true \
  POETRY_VIRTUALENVS_IN_PROJECT=true \
  BUILD_PATH=/opt/runtime

RUN pip install "poetry==$VERSION"

WORKDIR $BUILD_PATH
COPY pyproject.toml poetry.lock $BUILD_PATH/
RUN poetry install --no-interaction --no-ansi --no-dev --no-root

RUN useradd --create-home buggy

RUN mkdir /home/buggy/app
ADD . /home/buggy/app

USER buggy
WORKDIR /home/buggy/app

ENV PATH=$BUILD_PATH/.venv/bin:$PATH \
    PYTHONPATH=$PYTHONPATH:/home/buggy/app

CMD ["/opt/runtime/.venv/bin/python", "-u", "run.py"]
