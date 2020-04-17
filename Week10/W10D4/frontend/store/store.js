import { createStore } from 'redux';
import rootReducer from './reducer/root_reducer'

const configureStore = function() {
    const store = createStore(rootReducer);
}