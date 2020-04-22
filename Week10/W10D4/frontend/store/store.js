import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer'

const configureStore = function() {
    const store = createStore(rootReducer);
    return store;
}

export default configureStore 