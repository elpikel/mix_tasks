defmodule MixTasksManager.GithubAuthTest do
  use ExUnit.Case

  @github_response %Ueberauth.Auth{credentials: %Ueberauth.Auth.Credentials{expires: false,
    expires_at: nil, other: %{}, refresh_token: nil,
    scopes: ["public_repo", "user"], secret: nil,
    token: "48da4aa418abc0cc02cc8cc40579e70192571f38", token_type: "Bearer"},
    extra: %Ueberauth.Auth.Extra{
      raw_info: %{
        token: %OAuth2.AccessToken{
          access_token: "48da4aa418abc0cc02ea8dd40579e70192571f38", expires_at: nil, other_params: %{"scope" => "public_repo,user"},
          refresh_token: nil,
          token_type: "Bearer"
        },
        user: %{
          "collaborators" => 0,
          "two_factor_authentication" => true,
          "company" => nil,
          "bio" => nil,
          "following" => 1,
          "followers_url" => "https://api.github.com/users/test/followers",
          "public_gists" => 1,
          "id" => 29837,
          "avatar_url" => "https://avatars1.githubusercontent.com/u/295537?v=3",
          "events_url" => "https://api.github.com/users/test/events{/privacy}",
          "starred_url" => "https://api.github.com/users/test/starred{/owner}{/repo}",
          "emails" => [%{"email" => "test@gmail.com", "primary" => true, "verified" => true, "visibility" => "public"}],
          "private_gists" => 1,
          "blog" => "",
          "subscriptions_url" => "https://api.github.com/users/test/subscriptions",
          "type" => "User", "disk_usage" => 43690, "site_admin" => false,
          "owned_private_repos" => 0, "public_repos" => 32, "location" => nil,
          "hireable" => nil, "created_at" => "2008-10-19T20:28:54Z",
          "name" => "Test Test",
          "organizations_url" => "https://api.github.com/users/test/orgs",
          "gists_url" => "https://api.github.com/users/test/gists{/gist_id}",
          "following_url" => "https://api.github.com/users/test/following{/other_user}",
          "url" => "https://api.github.com/users/test",
          "email" => "test@gmail.com", "login" => "test",
          "html_url" => "https://github.com/test", "gravatar_id" => "",
          "received_events_url" => "https://api.github.com/users/test/received_events",
          "repos_url" => "https://api.github.com/users/test/repos",
          "plan" => %{"collaborators" => 0, "name" => "free", "private_repos" => 0, "space" => 976562499},
          "followers" => 4,"updated_at" => "2017-03-31T07:53:19Z", "total_private_repos" => 0
        }
      }
    },
    info: %Ueberauth.Auth.Info{
      description: nil, email: "test@gmail.com",
      first_name: nil, image: nil, last_name: nil, location: nil,
      name: "Test Test", nickname: "test", phone: nil,
      urls: %{
        api_url: "https://api.github.com/users/test",
        avatar_url: "https://avatars1.githubusercontent.com/u/25537?v=3", blog: "",
        events_url: "https://api.github.com/users/test/events{/privacy}",
        followers_url: "https://api.github.com/users/test/followers",
        following_url: "https://api.github.com/users/test/following{/other_user}",
        gists_url: "https://api.github.com/users/test/gists{/gist_id}",
        html_url: "https://github.com/test",
        organizations_url: "https://api.github.com/users/test/orgs",
        received_events_url: "https://api.github.com/users/test/received_events",
        repos_url: "https://api.github.com/users/test/repos",
        starred_url: "https://api.github.com/users/test/starred{/owner}{/repo}",
        subscriptions_url: "https://api.github.com/users/test/subscriptions"
      }
    },
    provider: :github,
    strategy: Ueberauth.Strategy.Github,
    uid: "test_id"
  }

  test "should extract user from github response" do
    {:ok, github_user} = MixTasksManager.GithubAuth.create_user(@github_response)

    assert github_user.name == "Test Test"
    assert github_user.github_id == "test_id"
    assert github_user.email == "test@gmail.com"
    assert github_user.avatar == "https://avatars1.githubusercontent.com/u/25537?v=3"
  end
end
