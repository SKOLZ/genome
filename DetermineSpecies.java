import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class DetermineSpecies {
	public static void main(String[] args) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		String inputPhenotypes = "";
		try {
			BufferedReader br = new BufferedReader(new FileReader(args[0]));
			inputPhenotypes = br.readLine();
			br.close();
		} catch (FileNotFoundException e) {
			System.out.println("Error al leer el archivo " + args[0] + ":");
		} catch (IOException e) {
			System.out.println("Error al leer el archivo " + args[0] + ":");
			e.printStackTrace();
		}
		map.put("human",
				new ArrayList<String>(
						Arrays.asList("behavior/neurological phenotype+heart vascular congestion+reproductive system phenotype+abnormal coronary vessel morphology+adipose tissue phenotype+abnormal heart position or orientation+abnormal innervation+normal phenotype+vision/eye phenotype+homeostasis/metabolism phenotype+abnormal heart position or orientation+muscle phenotype+abnormal heart size+abnormal heart size+abnormal brain morphology+nervous system phenotype+no phenotypic analysis+abnormal heart and great vessel attachment+adipose tissue phenotype+reproductive system phenotype+abnormal heart and great vessel attachment+nervous system phenotype+cellular phenotype+normal phenotype+abnormal meninges morphology+absent heart+taste/olfaction phenotype+other phenotype+abnormal meninges morphology+absent heart+reproductive system phenotype+abnormal spinal cord morphology+normal phenotype+abnormal heart valve morphology+abnormal heart atrium morphology+abnormal autonomic nervous system morphology+immune system phenotype+no phenotypic analysis+abnormal heart atrium and ventricle connection+abnormal heart iron level+abnormal spinal cord morphology"
								.split("\\+"))));
		int humanPhenotypeSize = map.get("human").size();

		map.put("bear",
				new ArrayList<String>(
						Arrays.asList("skeleton phenotype+abnormal heart and great vessel attachment+abnormal brain morphology+abnormal impulse conducting system morphology+respiratory system phenotype+abnormal coronary vessel morphology+immune system phenotype+abnormal outer ear morphology+muscle phenotype+abnormal heart size+liver/biliary system phenotype+abnormal nervous system development+abnormal heart atrium and ventricle connection+respiratory system phenotype+abnormal heart development+respiratory system phenotype+hearing/vestibular/ear phenotype+nervous system phenotype+dilated heart+nervous system phenotype+abnormal heart valve morphology+amyloid beta deposits+endocrine/exocrine gland phenotype+abnormal somatic nervous system morphology+abnormal coronary vessel morphology+abnormal meninges morphology+cardiac fibrosis+abnormal heart ventricle morphology+vision/eye phenotype+abnormal inner ear morphology+homeostasis/metabolism phenotype+embryogenesis phenotype+skeleton phenotype+abnormal nervous system tract morphology+nervous system phenotype+cardiovascular system phenotype+skeleton phenotype+abnormal somatic nervous system morphology+integument phenotype+abnormal heart ventricle morphology+immune system phenotype"
								.split("\\+"))));
		int bearPhenotypeSize = map.get("bear").size();

		map.put("orangutan",
				new ArrayList<String>(
						Arrays.asList("abnormal heart and great vessel attachment+abnormal brain morphology+cellular phenotype+abnormal heart and great vessel attachment+altered tumor pathology+limbs/digits/tail phenotype+liver/biliary system phenotype+abnormal heart and great vessel attachment+absent heart+abnormal heart septum morphology+abnormal innervation+abnormal heart and great vessel attachment+mortality/aging+other phenotype+altered tumor susceptibility+immune system phenotype+no phenotypic analysis+abnormal heart iron level+hearing/vestibular/ear phenotype+amyloid beta deposits+abnormal heart shape+abnormal heart valve morphology+abnormal nervous system tract morphology+abnormal ependyma morphology+abnormal heart shape+renal/urinary system phenotype+abnormal middle ear morphology+abnormal heart shape+abnormal heart layer morphology+abnormal nervous system tract morphology+limbs/digits/tail phenotype+abnormal meninges morphology+abnormal neuron morphology+skeleton phenotype+abnormal pericardium morphology+nervous system phenotype"
								.split("\\+"))));
		int orangutanPhenotypeSize = map.get("orangutan").size();

		map.put("horse",
				new ArrayList<String>(
						Arrays.asList("taste/olfaction phenotype+abnormal heart valve morphology+nervous system phenotype+altered tumor pathology+abnormal coronary vessel morphology+muscle phenotype+cellular phenotype+abnormal pericardium morphology+abnormal pericardium morphology+embryogenesis phenotype+abnormal spinal cord morphology+abnormal coronary vessel morphology+respiratory system phenotype+embryogenesis phenotype+cellular phenotype+muscle phenotype+craniofacial phenotype+abnormal nervous system development+abnormal heart size+abnormal spinal cord morphology+abnormal innervation+abnormal heart layer morphology+abnormal heart size+abnormal heart septum morphology+abnormal nervous system tract morphology+homeostasis/metabolism phenotype+muscle phenotype+taste/olfaction phenotype+liver/biliary system phenotype+hearing/vestibular/ear phenotype+abnormal inner ear morphology+taste/olfaction phenotype+heart vascular congestion+immune system phenotype+abnormal heart atrium morphology+abnormal ear development+abnormal nervous system tract morphology+alpha-synuclein inclusion body+mortality/aging+nervous system phenotype+respiratory system phenotype+abnormal heart atrium and ventricle connection+reproductive system phenotype+abnormal heart shape+no phenotypic analysis"
								.split("\\+"))));
		int horsePhenotypeSize = map.get("horse").size();

		map.put("chimp",
				new ArrayList<String>(
						Arrays.asList("abnormal heart position or orientation+dystrophic cardiac calcinosis+abnormal heart and great vessel attachment+abnormal heart septum morphology+digestive/alimentary phenotype+abnormal heart atrium and ventricle connection+growth/size phenotype+tumorigenesis+abnormal neuron morphology+pigmentation phenotype+abnormal middle ear morphology+hearing/vestibular/ear phenotype+abnormal heart atrium morphology+abnormal brain morphology+abnormal spinal cord morphology+abnormal ear development+immune system phenotype+abnormal heart layer morphology+abnormal heart development+alpha-synuclein inclusion body+abnormal neuron morphology+cardiac fibrosis+mortality/aging+abnormal heart shape+heart vascular congestion+abnormal glial cell morphology+abnormal heart shape+liver/biliary system phenotype+abnormal heart iron level+homeostasis/metabolism phenotype+amyloid beta deposits+abnormal coronary vessel morphology+adipose tissue phenotype+cardiovascular system phenotype+behavior/neurological phenotype+abnormal heart development+cardiac fibrosis+endocrine/exocrine gland phenotype+growth/size phenotype"
								.split("\\+"))));

		int chimpPhenotypeSize = map.get("chimp").size();

		String[] phenotypes = inputPhenotypes.split("\\+");
		List<String> speciesToBeRemoved = new ArrayList<String>();
		for (String phenotype : phenotypes) {
			Set<String> species = map.keySet();
			for (String specie : species) {
				List<String> aux = map.get(specie);
				if (!aux.contains(phenotype)) {
					speciesToBeRemoved.add(specie);
				} else {
					map.put(specie,
							aux.subList(aux.indexOf(phenotype), aux.size()));
				}
			}
		}
		
		for (String specie : speciesToBeRemoved) {
			map.remove(specie);
		}

		Set<String> leftSpecies = map.keySet();
		for (String specie : leftSpecies) {
			if (specie.equals("human")) {
				System.out.println("Specie: HUMAN - "
						+ (phenotypes.length * 100) / humanPhenotypeSize
						+ "% match");
				return;
			} else if (specie.equals("chimp")) {
				System.out.println("Specie: CHIMP - "
						+ (phenotypes.length * 100) / chimpPhenotypeSize
						+ "% match");
				return;
			} else if (specie.equals("horse")) {
				System.out.println("Specie: HORSE - "
						+ (phenotypes.length * 100) / horsePhenotypeSize
						+ "% match");
				return;
			} else if (specie.equals("orangutan")) {
				System.out.println("Specie: orangutan - "
						+ (phenotypes.length * 100) / orangutanPhenotypeSize
						+ "% match");
				return;
			} else if (specie.equals("bear")) {
				System.out.println("Specie: BEAR - "
						+ (phenotypes.length * 100) / bearPhenotypeSize
						+ "% match");
				return;
			}
		}
		System.out.println("UNKNOWN SPECIE");
	}
}
