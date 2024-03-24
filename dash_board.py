import dash
from dash import dcc, html
from dash.dependencies import Input, Output
import requests

# Create the Dash app
app = dash.Dash(__name__)

# Define the layout of the dashboard
app.layout = html.Div([
    dcc.Graph(id='scatter-plot'),
    html.Button('Refresh Data', id='refresh-button', n_clicks=0)
])

# Callback to update the scatter plot when the refresh button is clicked
@app.callback(
    Output('scatter-plot', 'figure'),
    [Input('refresh-button', 'n_clicks')]
)
def update_scatter_plot(n_clicks):
    # Fetch data from the API
    response = requests.get('https://api.example.com/data')
    data = response.json()

    # Extract x and y coordinates from the data
    x = [point['x'] for point in data]
    y = [point['y'] for point in data]

    # Create the scatter plot
    figure = {
        'data': [
            {'x': x, 'y': y, 'type': 'scatter', 'mode': 'markers'}
        ],
        'layout': {
            'title': 'Scatter Plot',
            'xaxis': {'title': 'X-axis'},
            'yaxis': {'title': 'Y-axis'}
        }
    }

    return figure

# Run the Dash app
if __name__ == '__main__':
    app.run_server(debug=True)