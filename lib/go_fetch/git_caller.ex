defmodule GoFetch.GitCaller do
  def getRepos(username) do
    url = "https://api.github.com/graphql"
    token = ""
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    query = Poison.encode! %{"query" => """
      {user(login: "#{username}") {
        avatarUrl(size:100),
        watching(first: 100, orderBy: {field: CREATED_AT, direction: DESC}) {
          nodes {
            name,
            url,
            updatedAt
          }
        } 
      }}
    """}
    %{body: body} = HTTPoison.post!(url, query, headers)
    Poison.decode!(body, keys: :atoms)
  end
end