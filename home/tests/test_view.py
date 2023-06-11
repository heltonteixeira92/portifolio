from http import HTTPStatus


def test_home_endpoint(client):
    resp = client.get('')
    assert resp.status_code == HTTPStatus.OK
