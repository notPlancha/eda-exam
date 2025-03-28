# first line: 1
@memory.cache
def make_graph(dataset):
  csgraph = np.zeros((dataset.shape[0], dataset.shape[0]))
  for row1, row2 in tqdm(list(permutations(dataset.iterrows(), 2))):
    id1, obs1 = row1
    id2, obs2 = row2
    dist = np.linalg.norm(obs1 - obs2)
    csgraph[id1, id2] = dist
    # csgraph[id2, id1] = dist # not needed since mst only takes undirected 
  return csr_array(csgraph)
