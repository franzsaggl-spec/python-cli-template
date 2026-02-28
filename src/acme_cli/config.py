from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_prefix="ACME_", extra="ignore")

    api_token: str | None = None


def get_settings() -> Settings:
    return Settings()
